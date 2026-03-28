#!/bin/sh
set -euo pipefail

mkdir -p "$TYPST_PACKAGES_PATH/local/quati-abnt" "$TYPST_PACKAGES_PATH/preview"

cd "$TYPST_PACKAGES_PATH/preview"

TARGET="quati-abnt"
DESIRED="../local/quati-abnt"

if [ -L "$TARGET" ]; then
  LINKDEST=$(readlink "$TARGET")
  if [ "$LINKDEST" != "$DESIRED" ]; then
    rm -f "$TARGET"
    ln -s "$DESIRED" "$TARGET"
  fi
else
  if [ -e "$TARGET" ]; then
    rm -rf "$TARGET"
  fi
  ln -s "$DESIRED" "$TARGET"
fi

exec "$@"
