#!/bin/bash

#~ kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -o /bin/
chmod +x /bin/kubectl

#~ helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash