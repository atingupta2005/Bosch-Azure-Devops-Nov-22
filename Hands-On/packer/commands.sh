source ~/python_venv/bin/activate

cd ~/Bosch-Azure-Devops-Nov-22/Hands-On/packer

sudo apt update
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt update
sudo apt install -y packer jq

#az login --use-device-code
#az account set --subscription="SUBSCRIPTION_ID"

az account show
az group list
az group create -n rgpacker$USER -l eastus
az group create -n packerdemo$USER -l eastus
sp_details="$(az ad sp create-for-rbac)"
client_id="$(echo $sp_details | jq '.appId'  | sed 's/"//g')"
client_secret="$(echo $sp_details | jq '.password'  | sed 's/"//g')"
tenant_id="$(echo $sp_details | jq '.tenant'  | sed 's/"//g')"
image_sku="$(az vm image list-skus --location "East US" --offer UbuntuServer --publisher Canonical  --query [-7].name  -o tsv)"
subscription_id="$(az account list --query "[?isDefault].id" -o tsv)"

az role assignment create --role "Contributor" --assignee $client_id

sed -i "s/insertyoursecrethereforthesp/$client_secret/g" ubuntu-test-var.pkr.hcl
sed -i "s/d2390854-6661-451d-bee2-3bd9b42b14cc/$client_id/g" ubuntu-test-var.pkr.hcl
sed -i "s/0040020a-b598-444c-8f0b-92f82e1224c0/$tenant_id/g" ubuntu-test-var.pkr.hcl
sed -i "s/944c019d-3e46-422b-b63a-86513f147562/$subscription_id/g" ubuntu-test-var.pkr.hcl
sed -i "s/944c019d-3e46-422b-b63a-86513f147562/$image_sku/g" ubuntu-test-var.pkr.hcl
sed -i "s/packerdemo/packerdemo$USER/g" ubuntu-test.pkr.hcl

cat ubuntu-test-var.pkr.hcl
echo $client_id
echo $client_secret
echo $tenant_id
echo $image_sku
echo $subscription_id
packer init .
packer build .
az vm create -resource-group rgpacker$USER -name myVM -image myPackerImage -admin-username azureuser -generate-ssh-keys
az vm open-port -resource-group rgpacker$USER -name myVM -port 80
