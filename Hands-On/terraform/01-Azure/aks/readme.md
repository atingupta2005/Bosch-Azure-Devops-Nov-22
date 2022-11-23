# Kubernetes cluster with Azure Kubernetes Service (AKS)
```
cd ~/Bosch-Azure-Devops-Nov-22/Hands-On/terraform/01-Azure/aks
```

```
az account show
```

```
az ad sp create-for-rbac --name spaks  --role Contributor --scopes /subscriptions/<sp-id>
```

## Update the terraform.tfvars file
```
nano terraform.tfvars
```

```
ls ~/.ssh
```

## Only if required
```
ssh-keygen
```

```
terraform init
```

```
terraform apply
```
