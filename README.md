# minecraft-server-automation
This repo has all the code and config needed to automatically, configure, and deploy a Minecraft server on AWS

## Requirements
Before running the automation scripts, ensure you have the following installed and configured on your local machine or VM:

### Tools
- Terraform v1.21.1
- aws-cli/1.22.34
- Ansible 2.10.8
- Bash 5.1.16
- nmap 7.8

### AWS Setup/Credendtials required
 - env.sh
    - has all your AWS creds witin the file EX:
    ```bash
    export AWS_ACCESS_KEY_ID=""
    export AWS_SECRET_ACCESS_KEY=""
    export AWS_SESSION_TOKEN=""
    ```
no other configuration is required, the file 'run_all.sh' will load your creds, create an ssh file, and do all the setup for you.

## How to run
1. Ensure you are in the home directory of the repo, or 'minecraft-server-automation' directory
2. Make sure you have all the tools and credentials configured correctly
3. Run the file 'run_all.sh' with 
  ```
  sudo ./run_all.sh
  ```
  or

  ```
  bash ./run_all.sh
  ```
4. Wait for the executable to finish, you will not have to enter in anything
5. the final output should be a nmap scan with a open port to your minecraft server

## How to destroy resources
> WARNING: THIS WILL REMOVE ALL YOUR MINECRAFT STUFF
1. run the 5th script in the scripts folder
  ```
  ./scripts/5_destroy.sh
  ```

## Pipeline of installation
