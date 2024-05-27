#!/bin/sh

SRC_FILE="${WORKSPACE_HOME}/src/main.c"
DST_FILE="${WORKSPACE_HOME}/target/main.bin"

gcc -o "${DST_FILE}" -static "${SRC_FILE}"

strip --strip-all "${DST_FILE}" -o "${DST_FILE}.stripped" || exit 5