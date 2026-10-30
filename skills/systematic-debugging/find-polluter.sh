#!/usr/bin/env bash
# Find the first matched test invocation that creates a path. Does not clean it up.
# Exit: 0 = all invocations passed without pollution; 1 = pollution; 2 = inconclusive.
set -euo pipefail

usage() {
  echo "Usage: bash $0 <path-to-check> <find-path-pattern> [-- command args...]" >&2
  echo "Default runner: npm test -- FILE. The matched file is appended to a custom runner." >&2
}

if [ "$#" -lt 2 ]; then
  usage
  exit 2
fi

pollution_check=$1
test_pattern=${2#./}
shift 2
if [ -z "$pollution_check" ] || [ -z "$test_pattern" ]; then
  usage
  exit 2
fi

runner=(npm test --)
if [ "$#" -gt 0 ]; then
  if [ "$1" != '--' ] || [ "$#" -lt 2 ]; then
    usage
    exit 2
  fi
  shift
  runner=("$@")
fi

has_pollution() {
  [ -e "$pollution_check" ] || [ -L "$pollution_check" ]
}

if has_pollution; then
  echo "Inconclusive: target already exists; no tests were run: $pollution_check" >&2
  exit 2
fi

polluter_tmp=$(mktemp -d "${TMPDIR:-/tmp}/find-polluter.XXXXXX") || exit 2
trap 'rm -rf -- "$polluter_tmp"' EXIT

# Preserve whitespace and newlines in filenames. This uses find -path semantics,
# plus the collapsed form of **/ to include directly nested files.
if ! find . -type f \( -path "./$test_pattern" -o -path "./${test_pattern//\*\*\//}" \) -print0 > "$polluter_tmp/files"; then
  echo 'Inconclusive: test file discovery failed; no tests were run.' >&2
  exit 2
fi

test_files=()
while IFS= read -r -d '' test_file; do
  test_files+=("$test_file")
done < "$polluter_tmp/files"

total=${#test_files[@]}
if [ "$total" -eq 0 ]; then
  echo "Inconclusive: no test files match: $test_pattern" >&2
  exit 2
fi

count=0
for test_file in "${test_files[@]}"; do
  if has_pollution; then
    echo 'Inconclusive: target appeared between test invocations; cannot attribute it.' >&2
    exit 2
  fi
  count=$((count + 1))
  printf '[%s/%s] Running: %s\n' "$count" "$total" "$test_file"
  runner_status=0
  "${runner[@]}" "$test_file" > "$polluter_tmp/output" 2>&1 || runner_status=$?

  if has_pollution; then
    printf 'Pollution appeared during invocation: %s\nTarget: %s\n' "$test_file" "$pollution_check" >&2
    if [ "$runner_status" -ne 0 ]; then
      printf 'The invocation also failed (exit %s). Recent output:\n' "$runner_status" >&2
      tail -n 80 "$polluter_tmp/output" >&2
    fi
    exit 1
  fi
  if [ "$runner_status" -ne 0 ]; then
    printf 'Inconclusive: test invocation failed (exit %s): %s\n' "$runner_status" "$test_file" >&2
    tail -n 80 "$polluter_tmp/output" >&2
    exit 2
  fi
done

printf 'No pollution observed: all %s matched test invocations passed.\n' "$count"
