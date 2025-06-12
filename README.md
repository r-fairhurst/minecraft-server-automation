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
- linux machine to run this on (it's a lot easier trust)

### AWS Setup/Credendtials required
 - env.sh
    - has all your AWS creds witin the file
    - EX:
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
    sudo bash ./run_all.sh
    ```
4. Wait for the executable to finish, you will not have to enter in anything
    > the last output should be "Your Minecraft server is up and running at: 'ip':25565
5. the final output should be a nmap scan with a open port to your minecraft server

## How to destroy resources
> WARNING: THIS WILL REMOVE ALL YOUR MINECRAFT STUFF
1. run the 5th script in the scripts folder
    ```
    ./scripts/5_destroy.sh
    ```

## Pipeline of installation
1. Running 'run_all.sh' will run scripts 0-4 within the scripts folder
2. It will first check for a ssh key, and if it doesn't not exist it will create one
3. Then it will set up the EC2 AWS instance using terraform, and whatever creds you put into the 'env.sh' file
4. Once the instance is up it will run ansible which will use the key that was generated to access the EC2 instance, and download java, the mincraft server jar, and set up the system to automatically start/restart the server on its own
5. If one would want to destroy the instance, run the 5th script, this will not be done automatically. 

## How to connect to the server once deployed
#### Playing the game 
#### Manual SSH
```
ssh -i minecraft-key.pem ec2-user@<public-ip>
```
> NOTE: the public IP can be found within ansible/host_ip.txt


## Resources used
 - framework for minecraft ansible: https://blog.kywa.io/mineops-part-2/ (had to edit most of it, java 17 no longer works, and did not use half of the features he sets up)
 - terraform setup: https://github.com/czantoine/minecraft-server-aws-ecs-fargate (again had to edit most of this)
 - learning terraform: https://controlmonkey.io/resource/terraform-aws-provider-guide/
 - learning ansible: https://docs.ansible.com/ansible/latest/getting_started/index.html 