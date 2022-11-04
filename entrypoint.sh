#!/bin/bash

set -eu

COLOR='\033[0;34m'
NORMAL='\033[0m'

mkdir -p ~/.ssh/
install -m 600 /dev/null ~/.ssh/id_rsa
echo "${GWD_HOSTING_SERVER_KEY}" > ~/.ssh/id_rsa

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
echo -e "${COLOR}Run on:${NORMAL} ${GWD_HOSTING_SERVER_ADDRESS}"
echo -e "${COLOR}Commands:${NORMAL}"

cat ~/script.sh

echo ""

echo -e "${COLOR}Connecting to ${host}...${NORMAL}"
sh -c "ssh -q -t -i ~/.ssh/id_rsa -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no '${host}' < ~/script.sh"
echo ""

echo ""
echo -e "${COLOR}GitHub Action completed.${NORMAL}"
