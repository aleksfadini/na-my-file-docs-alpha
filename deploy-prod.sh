#!/bin/bash

#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Welcome message
echo -e "${BLUE}Welcome to the My File Production Environment Setup and Deployment Script!${NC}"
echo -e "${BLUE}This script will guide you through the process of setting up and deploying the My File application.${NC}"
echo

# Check if Node.js is installed
if ! command -v node &> /dev/null
then
    echo -e "${RED}Node.js is not installed. Please install Node.js and try again.${NC}"
    exit 1
fi

# Prompt user for the existing folder within the home folder
read -p "Enter the existing folder name within your home folder where you want to create a new folder for the repositories: " existing_folder

# Check if the specified folder exists
if [ ! -d ~/"$existing_folder" ]; then
    echo -e "${RED}The specified folder does not exist in your home folder.${NC}"
    exit 1
fi

# Prompt user for the new folder name
read -p "Enter the new folder name for the repositories (default: my-file): " new_folder
new_folder=${new_folder:-my-file}

# Create the new folder within the specified existing folder
mkdir -p ~/"$existing_folder"/"$new_folder"
cd ~/"$existing_folder"/"$new_folder" || exit

# Clone the required repositories
repos=(
    "https://github.com/aleksfadini/na-my-file-infra.git"
    "https://github.com/aleksfadini/na-my-file-api.git"
    "https://github.com/aleksfadini/na-my-file-api-client.git"
    "https://github.com/aleksfadini/na-my-file-client.git"
    "https://github.com/aleksfadini/na-my-file-core-sdk-pkg.git"
)

for repo in "${repos[@]}"
do
    repo_name=$(basename "$repo" .git)
    if [ ! -d "$repo_name" ]; then
        git clone "$repo"
    else
        echo -e "${GREEN}$repo_name already exists. Skipping clone.${NC}"
    fi
done

# Install the core SDK package
echo -e "${GREEN}Installing core SDK package...${NC}"
cd na-my-file-core-sdk-pkg
npm install
cd ..

# Deploy the infrastructure
echo -e "${GREEN}Deploying infrastructure...${NC}"
cd na-my-file-infra
npm install
npm run cdk-bootstrap
npm run stack-deploy
cd ..

# Deploy the API
echo -e "${GREEN}Deploying API...${NC}"
cd na-my-file-api
npm install
npm run stack-deploy
cd ..

# Deploy the API client
echo -e "${GREEN}Deploying API client...${NC}"
cd na-my-file-api-client
npm install
npm run stack-deploy
cd ..

# Deploy the client
echo -e "${GREEN}Deploying client...${NC}"
cd na-my-file-client
npm install
npm run deploy-prod
cd ..

echo -e "${GREEN}Deployment completed successfully!${NC}"
echo -e "${BLUE}Thank you for using the My File Production Environment Setup and Deployment Script.${NC}"
echo -e "${BLUE}Your My File application is now set up and ready to use.${NC}"