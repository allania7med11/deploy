# Automated Deployment with Ansible
## Overview

This repository contains an automated deployment system powered by Ansible, designed to streamline the deployment process for various projects. The system orchestrates the deployment flow seamlessly, from initial setup to deployment on production servers. This README provides an overview of the automated deployment process and its key components.

## Project Links

These are the projects built and deployed using this Automated Deployment Tool.

- **Portfolio**: [https://about.effectivewebapp.com/](https://about.effectivewebapp.com/)
- **Structure Analysis Software**: [https://structure.effectivewebapp.com/](https://structure.effectivewebapp.com/)
- **Travel Planner**: [https://travelplanner.effectivewebapp.com/](https://travelplanner.effectivewebapp.com/)
- **Shoppingify Website**: [https://structure.effectivewebapp.com/](https://shop.effectivewebapp.com/)


## Deployment Flow

- **Setup Virtual Machine**:
  The deployment flow begins with the creation of a virtual machine using Vagrant for staging and testing purposes. From there, the system utilizes Ansible to automate the setup and configuration of the virtual machine environment. This includes installing Postgres, Docker, and Nginx.

- **Build and Run Project Locally in Vagrant Virtual Machine**:
  This step involves pulling changes from the GitHub repository and triggers the build process for Docker images based on project code and configurations. Docker containers are then run to generate the static folder or as a backend container. After successful build and testing, the Docker image is pushed to Docker Hub, and static folders are pushed to Google Drive.

- **Pull and Run Project in the Production Server**:
  The system checks if the database exists. If not, it creates one and pulls the initial database backup from Google Drive, loading it into the database. Additionally, the Docker image is pulled, and a container for the backend is run. The system then pulls the generated frontend and static folder from Google Drive and unzips it in the `/var/www/` folder. Nginx configuration is added to `site-enabled`, so it will be responsible for mapping incoming requests for that domain to the backend container's `back_static` folder or the generated frontend folder depending on the URL.

- **SSL Configuration**:
  Finally, SSL is configured using Certbot for the needed domains to run the website with HTTPS, ensuring secure communication between clients and the server.


## Usage

To use the automated deployment system, follow these steps:

1. **Clone Repository**: Clone this repository to your local machine.
   
2. **Install Dependencies**: Install dependencies, including Vagrant, Ansible, and any other required tools.
   
3. **Setup Environment Variables**: Set up a `.env` file in the root project directory to store environment variables. Define the necessary variables according to the "Environment Configuration" section.

4. **Run Vagrant Virtual Machine**: Execute the command to run the Vagrant virtual machine.

5. **Configure Ansible Hosts**: Configure the host you want to run the Ansible playbook on with similar names to the ones mentioned in `ansible/inventory/vm-setup-playbook/`. For example, use "local" for the Vagrant virtual machine, "prod_root" to log in to the server as the root user, and "prod" to log in to the server as a normal user with SSH. These steps usually reside in `/home/<username>/.ssh/config`, which is typically configured to login to the server with SSH in Visual Studio Code using the Remote-SSH extension.

6. **Customize Project Variables**: If you want to customize any variables in the projects, such as `db_init_compress_name` used to pull the initial database from Google Drive, navigate to `ansible/roles/<project_name>/vars/main.yml`. Here, you can check and update all the variables used in running that playbook.

7. **Visual Studio Code Task Configuration**: Duplicate the `.vscode.example` directory to `.vscode`. In `.vscode/settings.json`, set the playbook you want to run in the `ansible` folder. Specify the host you want to run the playbook on (`prod` or `prod_staging`) and the job you want to run in the `tasks` folder of the related playbook (`run_project`, `load_db`, `backup_db`).



## Contributors
- Allani Ahmed <allania7med11@gmail.com>

---
## License & copyright
© Allani Ahmed, Full Stack Web Developer


## Environment Configuration

This section provides information about the environment configuration for this project.

### Environment Variables

This project uses a `.env` file to configure its environment. You can create a `.env` file in the project root directory and set the following environment variables:

- `REMOTE_USERNAME`: The username for accessing the remote server.
- `REMOTE_PASSWORD`: The password for the remote server.
- `POSTGRES_USER`: The PostgreSQL database user.
- `POSTGRES_PASSWORD`: The password for the PostgreSQL user.
- `CLIENT_ID`: The client ID for the Google Drive API with the `https://www.googleapis.com/auth/drive.file` scope.
- `CLIENT_SECRET`: The client secret for the Google Drive API.
- `REFRESH_TOKEN`: The refresh token used to renew the Google Drive API credentials.
- `EMAIL`: The email address used in the Certbot command for SSL certificates.
- `PORTFOLIO_SERVER`: The server URL for the portfolio application.
- `PORTFOLIO_FOLDER_ID`: The folder ID in Google Drive used for the portfolio application.
- `STRUCTURE_SERVER`: The server URL for the structure application.
- `STRUCTURE_FOLDER_ID`: The folder ID in Google Drive used for the structure application.
- `STRUCTURE_FRONT_FOLDER_ID`: The front-end folder ID in Google Drive used for the structure application.
- `STRUCTURE_BACK_FOLDER_ID`: The backup folder ID in Google Drive used for the structure application.
- `SHOP_SERVER`: The server URL for the shop application.
- `SHOP_FOLDER_ID`: The folder ID in Google Drive used for the shop application.
- `SHOP_FRONT_FOLDER_ID`: The front-end folder ID in Google Drive used for the shop application.
- `SHOP_BACK_FOLDER_ID`: The backup folder ID in Google Drive used for the shop application.
- `TRAVELPLANNER_SERVER`: The server URL for the travel planner application.
- `TRAVELPLANNER_FOLDER_ID`: The folder ID in Google Drive used for the travel planner application.
- `DOCKERHUB_USERNAME`: The Docker Hub username.
- `DOCKERHUB_PASSWORD`: The Docker Hub password.

Make sure to update these values to match your specific environment configuration. You can check `.env.example` for reference.