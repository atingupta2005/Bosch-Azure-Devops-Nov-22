## Create Key
```
ssh-keygen -f ~/.ssh/ansible_id_rsa
chmod 0600 ~/.ssh/ansible_id_rsa
```

## Copy Key to Ansible Host
```
ssh-copy-id -i ~/.ssh/ansible_id_rsa.pub ansibleroot@<ansible-host-ip>
```

## Test the key
```
ssh -i ~/.ssh/ansible_id_rsa ansibleroot@<ansible-host-ip>
exit
```
