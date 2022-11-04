#!/bin/bash

set -eu

COLOR='\033[0;34m'
NORMAL='\033[0m'

echo ""
echo -e "${COLOR}Starting the Update Grant Web Design Application action...${NORMAL}"
echo -e "${COLOR}Triggered by:${NORMAL} ${GITHUB_TRIGGERING_ACTOR}"
echo ""
echo -e "${COLOR}Installing the SSH private key...${NORMAL}"
echo ""

mkdir -p ~/.ssh/
install -m 600 /dev/null ~/.ssh/id_rsa
echo "${INPUT_PRIVATEKEY}" > ~/.ssh/id_rsa

install -m 700 /dev/null ~/script.sh
echo '# Environment variables:' >> ~/script.sh
env -0 | while read -r -d '' line; do
    # Skip unnecessary env vars, wrap the single- or multiline value in single quotes, escape existing single quotes.
    [[ ! ${line} =~ ^(HOSTNAME=|HOME=|INPUT_) ]] && echo "${line%%=*}='$(echo "${line#*=}" | sed "s/'/'\\\\''/g")'" >> ~/script.sh
done
echo '' >> ~/script.sh
echo '# Commands:' >> ~/script.sh
echo "cd ${INPUT_GITFOLDERLOCATION} && bash build-start-application.sh" >> ~/script.sh

echo ""
echo -e "${COLOR}Run on:${NORMAL} ${INPUT_SERVERADDRESS}"
echo -e "${COLOR}Commands:${NORMAL}"
cat ~/script.sh


echo -e "${COLOR}Key:${NORMAL}"
cat /github/home/.ssh/id_rsa


echo -e "${COLOR}Connecting to ${INPUT_SERVERADDRESS}...${NORMAL}"
sh -c "ssh -t -i ~/.ssh/id_rsa -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no '${INPUT_SERVERADDRESS}' < ~/script.sh"
echo ""

echo ""
echo -e "${COLOR}GitHub Action completed.${NORMAL}"
