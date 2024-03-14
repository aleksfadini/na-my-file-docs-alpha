# Getting Started - Quickstart Guide

This guide will walk you through the process of deploying the My File repositories, excluding the documentation repositories. By following these steps, you'll have the My File system up and running in no time.

### Preliminary Note

This is the quickest way to get My File up and running, without using configuration scripts. This will deploy a production suite, databases, and app. We instead reccomend you deploy and test a _dev_ version before.

## Prerequisites

Before you begin, ensure that you have the following software installed on your machine:

- Node.js (version 14 or later)
- npm (Node Package Manager)

### Node.js Installation

Install Node.js and npm by following the instructions for your operating system:

- [Node.js Installation Guide](https://nodejs.org/en/download/)
- [Downloading and installing Node.js and npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)

## Quickest Installation and Deployment

If you would like to do the fastest installation and deployment, simply use the script included in this repository. In order to do so, do the following:

launch the script:

./deploy-prod.sh

The script will ask you where you wish to install the repository files before deployment, within your home folder.
Follow the instruction.

If you prefer to do a slilghly longer but manual installation, follow the instructions on the next section, _Manual Installation and Deployment_

## Manual Installation and Deployment

These are the instructions for the manual installation and deployment, which also follow what the install script is doing.

### Installation

2. Clone the required My File repositories:
   ```bash
   git clone https://github.com/your-org/na-my-file-infra.git
   git clone https://github.com/your-org/na-my-file-api.git
   git clone https://github.com/your-org/na-my-file-api-client.git
   git clone https://github.com/your-org/na-my-file-client.git
   git clone https://github.com/your-org/na-my-file-core-sdk-pkg.git
   ```

### Deployment

1. Deploy the infrastructure:

   ```bash
   cd na-my-file-infra
   npm install
   npm run stack-deploy
   ```

2. Deploy the API:

   ```bash
   cd ../na-my-file-api
   npm install
   npm run stack-deploy
   ```

3. Deploy the API client:

   ```bash
   cd ../na-my-file-api-client
   npm install
   npm run stack-deploy-prod
   ```

4. Deploy the client:

   ```bash
   cd ../na-my-file-client
   npm install
   npm run deploy-prod
   ```

5. Install the core SDK package:
   ```bash
   cd ../na-my-file-core-sdk-pkg
   npm install
   ```

Congratulations! You have successfully deployed the My File repositories. The system should now be up and running.

## Next Steps

- Refer to the individual repository documentation for detailed information on configuration, customization, and usage.
- Explore the deployed applications and start using the My File system.
- If you encounter any issues or have questions, please refer to the troubleshooting guides or reach out to the My File community for support.

Happy document management & sharing with My File!
