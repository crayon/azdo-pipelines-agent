#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes \
  && apt-get update && apt-get install -y --no-install-recommends ca-certificates wget curl libicu66 apt-transport-https software-properties-common

wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

apt-get update && apt-get install -y --no-install-recommends \
  dotnet-sdk-5.0 \
  dotnet-sdk-3.1 \
  git unzip \
  powershell


# AZ Cli
curl -LsS https://aka.ms/InstallAzureCLIDeb | bash \
  && rm -rf /var/lib/apt/lists/

# Kubernetes
if [[ ${KUBERNETES} ]]; then
  curl https://raw.githubusercontent.com/crayon/azdo-pipelines-agent/main/scripts/kubernetes.sh | bash ;
fi

# Docker
if [ ${DOCKER} ]; then
  curl https://get.docker.com | bash ;
fi