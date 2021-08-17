#!/bin/zsh
# Forwards traffic to specified target through preferred bastion from list
# Usage: sshforward <bastion> <localport> <target> [targetport]
BASTION_NAME=$1
LOCAL_PORT=$2
TARGET_ENDPOINT=$3
TARGET_PORT=${4:-443}

case $BASTION_NAME in
    cicddev-test )
        BASTION_ENDPOINT="bastion.us-west-2.test.cicddev.expedia.com"
        ;;
    cicdtools-test )
        BASTION_ENDPOINT="bastion.us-west-2.test.cicdtools.expedia.com"
        ;;
    cicdtools-prod )
        BASTION_ENDPOINT="bastion.us-west-2.prod.cicdtools.expedia.com"
        ;;
    cicdtools-prodp )
        BASTION_ENDPOINT="bastion.us-west-2.prodp.cicdtools.expedia.com"
        ;;
    * )
        echo "Invalid Bastion name : ${BASTION_NAME}"
        echo "Usage: sshforward <bastionname> <localport> <target> [targetport]"
        echo "Supported: cicddev-test, cicdtools-test, cicdtools-prod, cicdtools-prodp"
        exit 1
        ;;
esac


ssh -N -f -L ${LOCAL_PORT}:${TARGET_ENDPOINT}:${TARGET_PORT} ${BASTION_ENDPOINT}
