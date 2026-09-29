##
# Interactive shell functions
##

# Manage developer accounts
precheck_ie() {
    mkdir -p ${MT_DEV_FOLDER}/$(whoami)

    if [ ! -f ${MT_DEV_FOLDER}/base/bashrc ]; then
        touch ${MT_DEV_FOLDER}/base/bashrc
    fi
}

start_ie() {
    msg_info "$(whoami) special bashrcc -> ${MT_DEV_FOLDER}/base/bashrc"

    subshell=true bash --rcfile ${MT_DEV_FOLDER}/base/bashrc
}

spawn_ie() {
    trap - SIGINT INT
    trap - ERR
    set +e

    precheck_ie

    start_ie

    set -e
}

reload() {
    unimplemented
}
