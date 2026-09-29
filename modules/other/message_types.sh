##
#   Colors for message functions
##

RED='\033[0;31m'
LRED='\033[1;31m'

ORANGE='\033[0;33m'
YELLOW='\033[1;33m'

GREEN='\033[0;32m'
LGREEN='\033[1;32m'

BLUE='\033[0;34m'
LBLUE='\033[1;34m'

WHITE='\033[1;37m'

##
# Other functions
##

newline() {
    echo " "
}

spacer() {
    echo " "
    echo -e ${GREEN}------------------${WHITE}
    echo " "
}

unimplemented() {
    echo -e "${ORANGE}[ TO BE IMPLEMENTED ]: ${YELLOW}$@${WHITE}"
}

##
#   Message functions
##

message() {
    echo -e "${GREEN}[ MESSAGE ]: ${LGREEN}$@${WHITE}"
}

sel_option() {
    echo -e "${ORANGE}[ SELECTED ]: ${YELLOW}$@${WHITE}"
}

msg_info() {
    echo -e "${ORANGE}[ INFO ]: ${YELLOW}$@${WHITE}"
}

warning() {
    echo -e "${ORANGE}[ WARNING ]: ${YELLOW}$@${WHITE}"
}

error() {
    echo -e "${RED}[ ERROR ]: ${LRED}$@${WHITE}"

    if [ "$MT_IS_IE" == "false" ]; then
        exit 1
    fi
}

fault() {
    echo -e "${RED}[ FAULT ]: ${LRED}$@${WHITE}"
}

loading() {
    echo -e "${BLUE}[  LOAD  ]: ${LBLUE}$@${WHITE}"
}

loaded() {
    echo -e "${BLUE}[ LOADED ]: ${LBLUE}$@${WHITE}"
    sleep 0.1
}
