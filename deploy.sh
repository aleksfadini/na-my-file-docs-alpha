#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Set the folder name as a variable
new_folder="na-my-file"

# Record the start time
start_time=$(date +%s)

# Welcome message
echo -e "${BLUE}Welcome to the My File Production Environment Setup and Deployment Script!${NC}"
echo -e "${BLUE}This script will guide you through the process of setting up and deploying the My File application.${NC}"
echo

#####################
## Dependencies check
######################
echo -e "${NC}Checking Dependencies...${NC}"
# Check if git is installed
if ! command -v git &> /dev/null
then
    echo -e "${RED}git is not installed. Please install git and try again.${NC}"
    exit 1
fi
# Check if Node.js is installed
if ! command -v node &> /dev/null
then
    echo -e "${RED}Node.js is not installed. Please install Node.js and try again.${NC}"
    exit 1
fi
# Check if npm is installed
if ! command -v npm &> /dev/null
then
    echo -e "${RED}npm is not installed. Please install npm and try again.${NC}"
    exit 1
fi
echo -e "${GREEN}Dependencies found!${NC}"

#######################
## Questions / User Input
#######################
# Prompt user for AWS profile name
read -p "Enter your AWS profile name: " aws_profile

# Prompt user for environment (dev or prod)
read -p "Enter the environment to deploy (1 for dev, 2 for prod) [default: dev]: " environment
environment=${environment:-1}

# Check if the environment is valid
if [ "$environment" != "1" ] && [ "$environment" != "2" ]; then
    echo -e "${RED}Invalid environment. Please enter either '1' for dev or '2' for prod.${NC}"
    exit 1
fi

# Set the environment based on user input
if [ "$environment" == "1" ]; then
    environment="dev"
else
    environment="prod"
fi

#######################
## Folder Prep and Repo Cloning
#######################
echo -e "${NC}Setting Up Folders...${NC}"
# Create the new folder within the current directory
mkdir -p "$new_folder"
cd "$new_folder" || exit
echo -e "${GREEN}Done!${NC}"
echo -e "${NC}Cloning Repos...${NC}"
# Clone the required repositories
repos=(
    "https://github.com/productlabllc/na-my-file-infra.git"
    "https://github.com/productlabllc/na-my-file-api.git"
    "https://github.com/productlabllc/na-my-file-api-client.git"
    "https://github.com/productlabllc/na-my-file-client.git"
    "https://github.com/productlabllc/na-my-file-core-sdk-pkg.git"
)

for repo in "${repos[@]}"
do
    repo_name=$(basename "$repo" .git)
    if [ ! -d "$repo_name" ]; then
        git clone "$repo" || { echo -e "${RED}Failed to clone $repo.${NC}"; exit 1; }
    else
        echo -e "${GREEN}$repo_name already exists. Skipping clone.${NC}"
    fi
done
echo -e "${GREEN}Done!${NC}"

#######################
## Installation and Deployment
#######################
echo -e "${NC}Starting Installation...${NC}"
# Install the core SDK package
echo -e "${NC}Installing core SDK package...${NC}"
cd na-my-file-core-sdk-pkg
npm install || { echo -e "${RED}Failed to install core SDK package.${NC}"; exit 1; }
cd ..

# Deploy the infrastructure
echo -e "${GREEN}Deploying infrastructure...${NC}"
cd na-my-file-infra
npm install || { echo -e "${RED}Failed to install dependencies for infrastructure.${NC}"; exit 1; }
AWS_PROFILE="$aws_profile" npm run cdk-bootstrap || { echo -e "${RED}Failed to bootstrap CDK for infrastructure.${NC}"; exit 1; }
if [ "$environment" == "dev" ]; then
    AWS_PROFILE="$aws_profile" npm run stack-deploy-dev || { echo -e "${RED}Failed to deploy infrastructure for dev environment.${NC}"; exit 1; }
else
    AWS_PROFILE="$aws_profile" npm run stack-deploy-prod || { echo -e "${RED}Failed to deploy infrastructure for prod environment.${NC}"; exit 1; }
fi
cd ..

# Install the API client dependencies
echo -e "${GREEN}Installing API client dependencies...${NC}"
cd na-my-file-api-client
npm install || { echo -e "${RED}Failed to install dependencies for API client.${NC}"; exit 1; }
cd ..

# Deploy the API
echo -e "${GREEN}Deploying API...${NC}"
cd na-my-file-api
npm install || { echo -e "${RED}Failed to install dependencies for API.${NC}"; exit 1; }
npm run generate-oas || { echo -e "${RED}Failed to generate OAS.${NC}"; exit 1; }
cd ..

# Deploy the client
echo -e "${GREEN}Deploying client...${NC}"
cd na-my-file-client
npm install || { echo -e "${RED}Failed to install dependencies for client.${NC}"; exit 1; }
if [ "$environment" == "dev" ]; then
    AWS_PROFILE="$aws_profile" npm run deploy-dev || { echo -e "${RED}Failed to deploy client for dev environment.${NC}"; exit 1; }
else
    AWS_PROFILE="$aws_profile" npm run deploy-prod || { echo -e "${RED}Failed to deploy client for prod environment.${NC}"; exit 1; }
fi
cd ..

# Record the end time
end_time=$(date +%s)

# Calculate the total execution time
execution_time=$((end_time - start_time))

# Print the total execution time
echo -e "${GREEN}Deployment completed successfully!${NC}"
echo -e "${BLUE}Thank you for using the My File Production Environment Setup and Deployment Script.${NC}"
echo -e "${BLUE}Your My File application is now set up and ready to use in the $environment environment.${NC}"
echo -e "${BLUE}Total execution time: $execution_time seconds.${NC}"