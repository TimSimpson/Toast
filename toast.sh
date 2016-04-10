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

readonly root_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
readonly output_dir="${root_dir}/Output"
readonly tools_dir=${tools_dir:-$root_dir/Tools}

function cmd_check() {
    # Check that Toast is working on this machine.
    #
    echo 'Checking for Tools...'
    if [ ! -d `msys_path "${tools_dir}"` ]; then
        echo "Can't find tools_dir (`msys_path ${tools_dir}`)."
        exit 1
    fi
    if [ ! -d `msys_path "${output_dir}"` ]; then
        echo "Output directory is not available (`msys_path ${output_dir}`)."
        exit 1
    fi
    echo 'Checking for common Unix tools...'
    ls -la > /dev/null
    which
    echo 'Checking for mercurial...'
    hg > /dev/null
    echo 'Checking for Python 2...'
    python2.7 --version > /dev/null
}

function cmd_install_boar() {
    # Installs the Boar VCS.
    cd "${root_dir}/Tools"
    #hg clone https://bitbucket.org/mats_ekberg/boar
    mkdir -p "${output_dir}"/Tools
    echo '@echo off
@python2.7 '`cygpath_path "${tools_dir}"/boar/boar`' %1 %2 %3 %4 %5 %6 %7 %8 %9' > "${output_dir}"/Tools/boar.bat
    echo "python2.7 "${tools_dir}"/boar/boar $@" > "${output_dir}"/Tools/boar.sh
}


function cmd_refresh () {
    # Refresh command selection to reflect script.
    mkdir -p Output
    python "${root_dir}/Tools/BashiBazook/bashi.py" "${root_dir}/toast.sh" > "${output_dir}/toast.bashi"
}

set +e
source "${output_dir}/toast.bashi" || cmd_refresh
set -e

source "${output_dir}/toast.bashi"
source "${root_dir}/Tools/utils.sh"

bashi_run $@
