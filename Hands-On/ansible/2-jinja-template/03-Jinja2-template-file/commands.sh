source ~/python_venv/bin/activate
cd ~/Bosch-Azure-Devops-Nov-22/Hands-On/ansible
cd 2-jinja-template/03-Jinja2-template-file

## Running Playbook
ansible-playbook -i hosts jinja2_playbook.yml
ansible all -i hosts -a "cat /tmp/ansible_template.out"
