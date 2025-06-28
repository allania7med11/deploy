setup-ansible: ## Install Ansible dependencies from requirements.yml
	ansible-galaxy install -r ansible/requirements.yml

chattag_staging: ## Deploy ChatTag AI to staging
	./run_ansible.sh chattag_staging local run_project
