
function msys_path() {
    if [ -z "${WINDIR}" ]; then
        echo $@
    else
        cygpath -w $@ | sed -e 's/Cygwin\\c//g'
    fi
}

function cygpath_path() {
    if [ -z "${WINDIR}" ]; then
        echo $@
    else
        cygpath -w $@
    fi
}
