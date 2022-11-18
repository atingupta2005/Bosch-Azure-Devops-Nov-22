# Remove Azure CLI (If already there)
sudo apt-get remove -y azure-cli
rm -rf ~/.azure

# Remove Ansible (If already there)
sudo apt remove -y ansible

# Remove Python venv
rm -rf ~/python_venv

# Install Python Virtual env (If required)
sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install -y python3.8 python3.8-venv

# Create Virtual Env (If required)
python3.8 -m venv ~/python_venv
source ~/python_venv/bin/activate
python --version

# Install Azure CLI (If Required)
pip install azure-cli
az login --use-device-code

# Install Ansible
source ~/python_venv/bin/activate
pip install --upgrade pip
pip install ansible[azure]
sudo apt install -y sshpass
ansible --version
which ansible
