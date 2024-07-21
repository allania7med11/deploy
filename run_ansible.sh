#!/bin/bash
# Load environment variables
export $(cat .env | xargs)
# Run Ansible playbook
ansible-playbook --inventory ansible/inventory/vm-setup-playbook/hosts ansible/$1.yml --extra-vars "host_on=$2 job=$3" -vv
