#!/bin/bash
# test-api-gen.sh

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
#!/bin/bash
# test-api-gen.sh

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

# Get AWS profile from argument or use default
aws_profile=${1:-"default"}

# Function to run API generation steps
generate_api() {
    echo -e "${GREEN}Generating API and client code...${NC}"
    
    # Generate OpenAPI spec
    cd na-my-file-api
    npm install
    AWS_PROFILE="$aws_profile" npm run generate-oas
    AWS_PROFILE="$aws_profile" npm run generate-api-client
    cd ..

    # Build API client
    cd na-my-file-api-client
    npm install
    AWS_PROFILE="$aws_profile" npm run build
    cd ..
}

# Run the function
generate_api