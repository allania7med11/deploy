export $(cat .env | xargs)
ansible-playbook --inventory ansible/inventory/vm-setup-playbook/hosts ansible/vm-setup-playbook.yml
ansible-playbook --inventory ansible/inventory/vm-setup-playbook/hosts ansible/portfolio.yml

ansible-playbook --inventory ansible/inventory/vm-setup-playbook/hosts ansible/vm-setup-playbook-prod-root.yml
ansible-playbook --inventory ansible/inventory/vm-setup-playbook/hosts ansible/vm-setup-playbook-prod.yml


ansible-playbook --inventory ansible/inventory/vm-setup-playbook/hosts ansible/portfolio_deploy.yml