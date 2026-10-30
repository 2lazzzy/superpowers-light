#!/usr/bin/env python3
"""Install the skill folders without overwriting existing skills or configuration."""

import argparse
import os
from pathlib import Path
import shutil
import sys


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--dest", type=Path, help="Skill directory (default: $CODEX_HOME/skills or ~/.codex/skills)")
    parser.add_argument("--dry-run", action="store_true", help="Check conflicts and print the destination without writing")
    args = parser.parse_args()
    repo = Path(__file__).resolve().parent.parent
    sources = sorted(p for p in (repo / "skills").iterdir() if p.is_dir() and (p / "SKILL.md").is_file())
    if not sources:
        parser.error("No bundled skills found")
    for name in ("LICENSE", "NOTICE"):
        if not (repo / name).is_file():
            parser.error(f"Missing distribution file: {name}")

    codex_home = Path(os.environ.get("CODEX_HOME") or str(Path.home() / ".codex")).expanduser()
    destination = (args.dest.expanduser() if args.dest else codex_home / "skills").absolute()
    if destination.exists() and not destination.is_dir():
        parser.error(f"Destination is not a directory: {destination}")
    roots = [destination]
    if args.dest is None:
        # Check the usual flat installs and the upstream native-discovery symlink layout.
        roots.extend([Path.home() / ".codex/skills", Path.home() / ".agents/skills",
                      Path.home() / ".agents/skills/superpowers"])
    conflicts = sorted({str(root / source.name) for root in roots for source in sources
                        if (root / source.name).exists() or (root / source.name).is_symlink()})
    if conflicts:
        print("Installation stopped: existing skills were not changed.", file=sys.stderr)
        for path in conflicts:
            print(f"  {path}", file=sys.stderr)
        print("Review and back up conflicts outside skill discovery directories before retrying.", file=sys.stderr)
        return 1

    print(f"Destination: {destination}")
    print(f"Skills ({len(sources)}): {', '.join(p.name for p in sources)}")
    if args.dry_run:
        print("Dry run: no files written.")
        return 0

    created = []
    try:
        destination.mkdir(parents=True, exist_ok=True)
        for source in sources:
            target = destination / source.name
            target.mkdir()  # Exclusive creation: never merge with an existing skill.
            created.append(target)
            shutil.copytree(source, target, dirs_exist_ok=True)
            for name in ("LICENSE", "NOTICE"):
                shutil.copy2(repo / name, target / name)
    except BaseException:
        for target in reversed(created):
            shutil.rmtree(target)
        raise
    print("Installed. Start a new Codex chat to use the skills.")
    print("Existing global instructions and configuration were not changed.")
    return 0


if __name__ == "__main__":
    try:
        sys.exit(main())
    except OSError as error:
        print(f"Installation failed: {error}", file=sys.stderr)
        sys.exit(1)
