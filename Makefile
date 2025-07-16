setup-ansible: ## Install Ansible dependencies from requirements.yml
	ansible-galaxy install -r ansible/requirements.yml

chattag_staging: ## Deploy ChatTag AI to staging
	./run_ansible.sh chattag_staging local run_project

vm_setup_prod: ## Setup production VM infrastructure
	./run_ansible.sh vm_setup_prod prod

chattag_prod: ## Deploy ChatTag AI to prod
	./run_ansible.sh chattag_prod prod run_project

chattag_prod_shell: ## Open shell in ChatTag prod container
	ssh -t prod 'cd /home/vagrant/apps/chattag && docker exec -it chattag_backend /bin/bash'

driveplan_staging: ## Deploy Driveplan to staging
	./run_ansible.sh driveplan_staging local run_project

driveplan_prod: ## Deploy Driveplan to prod
	./run_ansible.sh driveplan_prod prod run_project

driveplan_prod_shell: ## Open shell in Driveplan prod container
	ssh -t prod 'cd /home/vagrant/apps/driveplan && docker exec -it driveplan_backend /bin/bash'