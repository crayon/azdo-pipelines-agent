# Azure DevOps Pipelines Agent

[![Container management](https://github.com/crayon/azdo-pipelines-agent/actions/workflows/container-management.yml/badge.svg)](https://github.com/crayon/azdo-pipelines-agent/actions/workflows/container-management.yml)

Hosted container image for the self-hosted Azure DevOps _(AzDO)_ Pipelines Agent. The goal is to keep the image up to date with the agent and try to be a safe resource for companies in the _House of Crayon_ but also for the general public. This is a community effort, please bear that in mind when submitting issues or suggestions.

All images are scanned for vulnerabilities during build and the latest is scanned weekly. If using an old version of the image, please make sure that you are checking it for vulnerabilities or upgrade periodically. Crayon is not liable if any vulnerability or exploit is found in these images as we merely assemble pieces of Open Source Software in one package, but if our weekly scan finds anything we will try to fix it as soon as possible.

>Note: Helm chart is on it's way

## Deploy to Kubernetes

To deploy the pipelines agent to Kubernetes you can use the example [deployment.yml](kubernetes/deployment.yml). Feel free to download it and change to better suit your needs.

First, you need to create the secret with the details for the deployment to use.

```bash
kubectl create secret generic azdevops \
  --from-literal=AZP_URL=https://dev.azure.com/yourOrg \
  --from-literal=AZP_TOKEN=YourPAT \
  --from-literal=AZP_POOL=NameOfYourPool \
  -n azuredevops
```

Then you can deploy the agent by running:

```bash
kubectl apply -f https://raw.githubusercontent.com/crayon/azdo-pipelines-agent/main/kubernetes/deployment.yml
```

