#!/usr/bin/env bash

set -euxo pipefail

DPI=$1
TMPDIR=$(mktemp -d)

# Relative to current directory
PARTIAL_OUTPUT=BIM_$(date +%F_%H%M%S)_${DPI}dpi
OUTPUT_DIR=output/${PARTIAL_OUTPUT}/

unzip input.zip -d "$TMPDIR"
find $TMPDIR/ -name \*.svg -print0 | xargs -0 rename 's/ //g'

find $TMPDIR/ -name \*.svg -print0 | xargs -0 inkscape --export-type=pdf --export-dpi=$DPI

mkdir -p "$OUTPUT_DIR"

find $TMPDIR/ -name \*.pdf -exec mv '{}' "$OUTPUT_DIR" ';'

cd "$OUTPUT_DIR"
pdfunite $(ls -v *.pdf) BIM_${DPI}dpi.pdf

cd ..
zip -r ${PARTIAL_OUTPUT} ${PARTIAL_OUTPUT}
rm -rf "$TMPDIR"
