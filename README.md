# minecraft-server-automation
This repo has all the code and config needed to automatically, configure, and deploy a Minecraft server on AWS

## Requirements

Before running the automation scripts, ensure you have the following installed and configured on your local machine or VM:

### Tools

- **Terraform** (version 1.0 or higher)  
  Used for infrastructure provisioning on AWS.  
  [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

- **AWS CLI** (version 2 recommended)  
  Used to interact with AWS services and manage credentials.  
  [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)

- **Ansible** (version 2.9 or higher)  
  Used to configure the Minecraft server on the EC2 instance.  
  [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

- **bash**
  Required to run the automation scripts.

### AWS Setup

you need a env.sh file :3
