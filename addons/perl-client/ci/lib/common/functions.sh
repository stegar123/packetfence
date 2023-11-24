#!/bin/bash

# dir of current script
SCRIPT_DIR=$(readlink -e $(dirname ${BASH_SOURCE[0]}))

# full path to root of FB sources
FB_SRC_DIR=$(echo ${SCRIPT_DIR} | grep -oP '.*?(?=\/ci\/)')


die() {
    echo "$(basename $0): $@" >&2 ; exit 1
}

log_section() {
   printf '=%.0s' {1..72} ; printf "\n"
   printf "=\t%s\n" "" "$@" ""
}

log_subsection() {
   printf "=\t%s\n" "" "$@" ""
}

get_pf_release() {
    PF_RELEASE_PATH=https://raw.githubusercontent.com/inverse-inc/packetfence/devel/conf/pf-release
    PF_MINOR_RELEASE=$(curl ${PF_RELEASE_PATH} | perl -ne 'print $1 if (m/.*?(\d+\.\d+)./)')
}
