#!/bin/bash

wget https://binary.mirantis.com/releases/get_container_cloud.sh
chmod 0755 get_container_cloud.sh
./get_container_cloud.sh
cd kaas-bootstrap
echo "Download a new license file from https://container-cloud.mirantis.com/. Click download download license under Try On-Prem."
read -p "Paste contents of mirantis license file: " mirantis_lic
echo $mirantis_lic > mirantis.lic


export AWS_DEFAULT_REGION=us-east-1
export AWS_ACCESS_KEY_ID=AAAAEXAMPLEXXX
export AWS_SECRET_ACCESS_KEY=ExAMpLE123XXXX987123
export KAAS_AWS_ENABLED=true

echo "Wait for the bootstrap to get as far as validating the AWS credentials, you should see a log message like: \n"
echo "`credential default/cloud-config not valid yet` \n"
echo "When you see the above message, use CTRL + c to quit the bootstrap.\n"
read -p "Are you ready to continue? (y/n): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    ./bootstrap.sh all
fi
