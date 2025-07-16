# Automated Deployment with Ansible

Enterprise-grade deployment automation system managing containerized applications across staging and production environments using Docker + Ansible orchestration.

## Deployed Projects

- **Portfolio**: [https://about.effectivewebapp.com/](https://about.effectivewebapp.com/) - Developer showcase with automated deployment system
- **Structure Analysis Software**: [https://structure.effectivewebapp.com/](https://structure.effectivewebapp.com/) - Engineering calculation software
- **Travel Planner**: [https://travelplanner.effectivewebapp.com/](https://travelplanner.effectivewebapp.com/) - Trip planning with weather forecasts and offline capabilities
- **Shopping Website**: [https://shop.effectivewebapp.com/](https://shop.effectivewebapp.com/) - eCommerce platform with AI chat assistance
- **ChatTagAI**: [https://chattagai.com/](https://chattagai.com/) - Multi-tenant SaaS chat widget platform
- **DrivePlan**: [https://driveplan.effectivewebapp.com/](https://driveplan.effectivewebapp.com/) - FMCSA-compliant truck driver trip planning

## Deployment Commands

```bash
# Infrastructure Setup
make setup-ansible      # Install Ansible dependencies
make vm_setup_prod      # Setup production VM infrastructure

# Project Deployments
make chattag_staging    # Deploy ChatTag AI to staging
make chattag_prod       # Deploy ChatTag AI to production
make chattag_prod_shell # Access production container shell
```

## Architecture

### 🚀 **Docker + Ansible Orchestration**
- **Vagrant Staging**: Local environment identical to production
- **Registry Integration**: Pull pre-built images, no code compilation
- **Environment Isolation**: Project-specific containers with dedicated configurations
- **Two-Tier Nginx**: Main proxy for domain mapping + project-level routing (`/api`, `/admin`, `/static`)

### 🔧 **Infrastructure Features**
- **Automated SSL**: Certbot integration for HTTPS
- **Database Management**: PostgreSQL with Google Drive backup integration
- **Monitoring**: Sentry error tracking for production applications
- **Multi-Project**: Isolated deployments on single infrastructure

## Environment Configuration

```bash
# Core Infrastructure
POSTGRES_USER=db_user
POSTGRES_PASSWORD=db_password

# Google Drive Integration
CLIENT_ID=google_drive_client_id
CLIENT_SECRET=google_drive_secret
REFRESH_TOKEN=refresh_token

# SSL & Domain Management
EMAIL=admin@yourdomain.com
CHATTAGAI_SERVER=chattagai.com
```

## Technology Stack

- **Orchestration**: Ansible for infrastructure automation
- **Containerization**: Docker with registry-based deployment
- **Virtualization**: Vagrant for staging environments
- **Web Server**: Nginx reverse proxy with SSL automation
- **Database**: PostgreSQL with automated backup/restore
- **Monitoring**: Sentry for real-time error tracking

---

**Enterprise-grade deployment automation demonstrating infrastructure as code, container orchestration, and production-ready DevOps practices.**

## Contributors
**Allani Ahmed** <allania7med11@gmail.com>

## License & Copyright
© Allani Ahmed, Full Stack Web Developer