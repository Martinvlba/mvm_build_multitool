##
# Interactive shell functions
##

# Manage developer accounts
precheck_ie() {
    mkdir -p ${MT_DEV_FOLDER}/$(whoami)

    # Copy over bashrc
    if [ ! -f ${MT_DEV_FOLDER}/$(whoami)/bashrc ]; then
        cp -fv ${MT_BASE_DIR}/developer/bashrc ${MT_DEV_FOLDER}/$(whoami)/bashrc
    fi

    # Create History file
    if [ ! -f ${MT_DEV_FOLDER}/$(whoami)/.bash_history ]; then
        touch ${MT_DEV_FOLDER}/$(whoami)/.bash_history
    fi
}

start_ie() {
    msg_info "$(whoami) special bashrcc -> ${MT_DEV_FOLDER}/$(whoami)/bashrc"

    subshell=true bash --rcfile ${MT_DEV_FOLDER}/$(whoami)/bashrc
}

spawn_ie() {
    set +e

    precheck_ie

    start_ie

    set -e
}

reload() {
    unimplemented
}
