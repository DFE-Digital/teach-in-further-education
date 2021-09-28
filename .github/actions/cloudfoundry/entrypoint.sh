#!/bin/sh -l

if [ -n "$INPUT_WORKING_DIR" ]; then
  cd "$INPUT_WORKING_DIR"
fi

cf7 login -a "$INPUT_CF_API" -u "$INPUT_CF_USERNAME" -p "$INPUT_CF_PASSWORD" -o "$INPUT_CF_ORG" -s "$INPUT_CF_SPACE"

sh -c "cf7 $*"