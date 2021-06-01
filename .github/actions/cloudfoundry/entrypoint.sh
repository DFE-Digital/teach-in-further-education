#!/bin/sh -l

cd "$INPUT_WORKING_DIR"
cf7 login -a "$INPUT_CF_API" -u "$INPUT_CF_USERNAME" -p "$INPUT_CF_PASSWORD" -o "$INPUT_CF_ORG" -s "$INPUT_CF_SPACE"
cf7 $*