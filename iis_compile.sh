#!/usr/bin/env bash
# Copyright 2025 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Philip Wiese <wiesep@iis.ee.ethz.ch>
#

LOGFILE="iis_compile.log"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

CMD_PREFIX='riscv questa-2022.3 '

# Clear logfile
echo -n > $LOGFILE

# Define function to run and check the return value of a command
# Inputs: $1 - command prefix
#         $2 - command
run_cmd() {
    echo -e "[CHIMERA] Running $2..."
    $1$2 >> $LOGFILE 2>&1
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}  -> $2 successful!${NC}"
    else
        echo -e "${RED}  -> $2 failed! Check $LOGFILE for more information.${NC}"
        exit 1
    fi
}

run_cmd "$CMD_PREFIX" "make chs-hw-init"
run_cmd "$CMD_PREFIX" "make snitch-hw-init"
run_cmd "$CMD_PREFIX" "make chim-sw"
run_cmd "$CMD_PREFIX" "make chim-bootrom-init"
run_cmd "$CMD_PREFIX" "make chs-sim-all"
run_cmd "$CMD_PREFIX" "make chim-sim"