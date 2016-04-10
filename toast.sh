#!/usr/bin/env bash
###############################################################################
#  TOAST SCRIPT
###############################################################################
#
#   Attempts to create a semi-unified command line experience.
#
###############################################################################
set -e

bashi_base_command="${bashi_base_command:-$0}"

readonly toast_root=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
readonly toast_output="${toast_root}/Output"
readonly toast_tools=${toast_tools:-$toast_root/Tools}

source "${toast_tools}/cmds.sh"

set +e
source "${toast_output}/toast.bashi" || cmd_refresh
set -e

source "${toast_output}/toast.bashi"
source "${toast_root}/Tools/utils.sh"

bashi_run $@
