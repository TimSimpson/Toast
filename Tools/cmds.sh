
function cmd_check() {
    # Check that Toast is working on this machine.
    #
    echo 'Checking for Tools...'
    if [ ! -d `msys_path "${toast_tools}"` ]; then
        echo "Can't find toast_tools (`msys_path ${toast_tools}`)."
        exit 1
    fi
    if [ ! -d `msys_path "${toast_output}"` ]; then
        echo "Output directory is not available (`msys_path ${toast_output}`)."
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

function check_tools_local() {
    if [ "" = "${TOOLS_LOCAL}"]; then
        echo "TOOLS_LOCAL environment variable not defined."
        exit 1
    fi
}

function cmd_install_boar() {
    # Installs the Boar VCS.
    cd "${toast_root}/Tools"
    hg clone https://bitbucket.org/mats_ekberg/boar
}

function cmd_refresh () {
    # Refresh command selection to reflect script.
    mkdir -p Output
    python "${toast_root}/Tools/BashiBazook/bashi.py" "${toast_root}/toast.sh" > "${toast_output}/toast.bashi"
}
