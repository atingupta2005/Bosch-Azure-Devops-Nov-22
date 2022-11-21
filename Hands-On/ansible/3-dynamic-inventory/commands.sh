source ~/python_venv/bin/activate
cd ~/Bosch-Azure-Devops-Nov-22/Hands-On/ansible
cd 3-dynamic-inventory

az account list
az account set --subscription '<subscription-name>'
az account list

ansible -u ansibleroot all -m ping -i inventory.azure_rm.yml

## Running Playbook
#nano playbook.yml
ansible-playbook -u ansibleroot playbook.yml -K

## Confirm content of the file in all hosts
ansible -u ansibleroot all -a "cat /tmp/testfile.txt"
