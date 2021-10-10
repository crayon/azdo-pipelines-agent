#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes \
  && apt-get update && apt-get install -y --no-install-recommends ca-certificates wget curl

wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

apt-get update && apt-get install -y --no-install-recommends \
dotnet-sdk-5.0 \
dotnet-sdk-3.1 \
git

curl -LsS https://aka.ms/InstallAzureCLIDeb | bash \
  && rm -rf /var/lib/apt/lists/*

shopt -s nocasematch
if [[ "${TOOLS}" = "k8s" ]]
  then
    curl https://raw.githubusercontent.com/crayon/azdo-pipelines-agent/main/scripts/kubernetes.sh | bash
fi