# Deploying to Kubernetes

To deploy the pipelines agent to Kubernetes you can use the [deployment.yml](deployment.yml) that we have here in the directory. Feel free to download it and change to better suit your needs.

## Quick start

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
