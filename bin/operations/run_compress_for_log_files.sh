#!/bin/bash

#######################################
CURRENT=$(cd $(dirname $0) && pwd)
PROJECT_ROOT="$(cd ${CURRENT%/}/../../ && pwd)"
BIN="${PROJECT_ROOT}/bin"

. ${BIN}/common.sh

LOG_GZIP_PERIOD=3
LOG_REMOVE_PERIOD=120
#######################################

find ${LOGS} -type f -mtime +${LOG_GZIP_PERIOD} -name '*.log.*' ! -name '*.gz' | xargs --no-run-if-empty gzip
find ${LOGS} -type f -mtime +${LOG_REMOVE_PERIOD} -name '*.gz' | xargs --no-run-if-empty rm