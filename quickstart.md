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

For the fastest installation and deployment of My File, you can utilize the provided script included in this repository. To do so, follow these steps:

1. Launch the script by running the following command in your terminal:

   ```
   ./deploy-prod.sh
   ```

2. The script will prompt you to specify the location within your home folder where you wish to install the repository files before deployment. Please provide the desired path when requested.

3. Follow the on-screen instructions to complete the installation and deployment process.

If you prefer a slightly longer but manual installation process, please refer to the next section, _Manual Installation and Deployment_, for detailed instructions.

## Manual Installation and Deployment

This section provides instructions for manually installing and deploying My File. These steps are equivalent to what the installation script performs.

### Installation

Clone the required My File repositories:

```bash
git clone https://github.com/your-org/na-my-file-infra.git
git clone https://github.com/your-org/na-my-file-api.git
git clone https://github.com/your-org/na-my-file-api-client.git
git clone https://github.com/your-org/na-my-file-client.git
git clone https://github.com/your-org/na-my-file-core-sdk-pkg.git
```

### Deployment

1. Install the core SDK package:

   ```bash
   cd ../na-my-file-core-sdk-pkg
   npm install
   ```

2. Deploy the infrastructure:

   ```bash
   cd na-my-file-infra
   npm install
   npm run cdk-bootstrap
   npm run stack-deploy-dev
   ```

3. Deploy the API:

   ```bash
   cd ../na-my-file-api
   npm install
   npm run stack-deploy
   ```

4. Deploy the API client:

   ```bash
   cd ../na-my-file-api-client
   npm install
   npm run stack-deploy-prod
   ```

5. Deploy the client:

   ```bash
   cd ../na-my-file-client
   npm install
   npm run deploy-prod
   ```

Congratulations! You have successfully deployed the My File repositories. The system should now be up and running.

## Next Steps

- Refer to the individual repository documentation for detailed information on configuration, customization, and usage.
- Explore the deployed applications and start using the My File system.
- If you encounter any issues or have questions, please refer to the troubleshooting guides or reach out to the My File community for support.

Happy document management & sharing with My File!
