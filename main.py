from pathlib import Path
import os
import sys


def main() -> int:
    executable = Path(__file__).resolve().parent / ".venv" / "bin" / "JLC2KiCadLib"

    if not executable.is_file():
        print(f"JLC2KiCadLib was not found at {executable}", file=sys.stderr)
        return 1

    if len(sys.argv) < 2:
        print(f"Usage: {Path(sys.argv[0]).name} LCSC_CODE [LCSC_CODE ...] [options]", file=sys.stderr)
        return 2

    os.execv(str(executable), [str(executable), *sys.argv[1:]])
    return 0


# if __name__ == "__main__":
    # raise SystemExit(main())
main()