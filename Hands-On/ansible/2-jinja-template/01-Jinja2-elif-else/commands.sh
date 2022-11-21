source ~/python_venv/bin/activate

cd ~/Bosch-Azure-Devops-Nov-22/Hands-On/ansible
cd 2-jinja-template/01-Jinja2-elif-else
## Running Playbook
ansible-playbook -i hosts facts_playbook.yml
ansible-playbook -i hosts jinja2_playbook.yml
