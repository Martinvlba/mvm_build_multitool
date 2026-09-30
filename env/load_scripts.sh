##
# Load everything
##

# Main components
source $MT_BASE_DIR/modules/global_exports.sh
source $MT_BASE_DIR/modules/other/message_types.sh
source $MT_BASE_DIR/modules/main_functions.sh
source $MT_BASE_DIR/modules/ie/ie_base.sh

# Android components
source $MT_BASE_DIR/modules/ndk/ndk_prepare.sh
source $MT_BASE_DIR/modules/ndk/ndk_toolchain.sh
