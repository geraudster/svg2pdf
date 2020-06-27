#!/usr/bin/env bash

set -euxo pipefail

DPI=$1
# Relative to current directory
OUTPUT_DIR=output/BIM_$(date +%F_%H%M%S)_${DPI}dpi/

inkscape --export-type=pdf --export-dpi=$DPI input/*.svg

mkdir -p "$OUTPUT_DIR"

mv input/*.pdf "$OUTPUT_DIR"

cd "$OUTPUT_DIR"
pdfunite $(ls -v *.pdf) BIM_${DPI}dpi.pdf
