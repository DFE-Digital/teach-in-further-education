#!/bin/sh -l

if [ -n "$INPUT_WORKINGDIR" ]; then
  cd "$INPUT_WORKINGDIR"
fi

cf login -a "$INPUT_CF_API" -u "$INPUT_CF_USERNAME" -p "$INPUT_CF_PASSWORD"

echo "Space: $INPUT_CF_SPACE"

#if [ -n "$INPUT_CF_ORG" ] && [ -n "$INPUT_CF_SPACE" ]; then
cf target -o "$INPUT_CF_ORG" -s "$INPUT_CF_SPACE"
#fi

sh -c "cf7 $*"