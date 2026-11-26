#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 <short-title-with-dashes>"
  exit 1
fi

root="$(cd "$(dirname "$0")/.." && pwd)"
date_str="$(date +%F)"
out="$root/write-ups/${date_str}-$1.md"

if [ -e "$out" ]; then
  echo "File already exists: $out"
  exit 1
fi

sed "s/YYYY-MM-DD/${date_str}/" "$root/write-ups/_template.md" > "$out"
echo "Created $out"
