#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd -- "$(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")" && pwd)"
output_dir="$HOME/Project/Kicad/LCSC-Generated-Library"
echo "Output directory: $output_dir"
if (($# == 0)); then
	printf 'Usage: %s LCSC_CODE [LCSC_CODE ...]\n' "$(basename "$0")" >&2
	exit 2
fi

exec "$script_dir/.venv/bin/python" "$script_dir/main.py" "$@" \
	-dir "$output_dir" \
	-footprint_lib "LCSC-Generated-Footprint" \
	-model_dir "LCSC-STEP" \
	-symbol_lib_dir "LCSC-Symbol" \
	-symbol_lib "LCSC-Generated-Symbol"