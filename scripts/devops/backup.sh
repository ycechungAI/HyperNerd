#!/bin/sh

set -xe

DATABASE_FILE="$1"
TIMESTAMP=$(date "+%s")
BACKUP_FILE="${DATABASE_FILE%%.*}-${TIMESTAMP}.${DATABASE_FILE#*.}"

cp "${DATABASE_FILE}" "${BACKUP_FILE}"
scp "${BACKUP_FILE}" "${BACKUP_TARGET}"