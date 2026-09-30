##
# Main functions for MT
##

mt_help() {
    message "###"
    message "# HELP MENU"
    message "# VERSION: ${MT_VERSION}"
    message "###"
    spacer
    message "$ help          : Shows this help menu"
    message "$ setup_android : Check and set up android essentials"
    message "$ mvm_meson     : Wrapper for meson with required args pre-added"
}
