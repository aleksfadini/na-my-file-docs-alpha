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

   ```bash
   ./deploy.sh
   ```

2. The script will:

   - Ask whether you want to deploy to development or production environment
   - Guide you through the deployment process

3. Follow the on-screen instructions to complete the installation and deployment process.

> **Recommended**: We strongly suggest deploying to a development environment first to test your configuration before deploying to production.

If you prefer a manual installation process, please refer to the next section, _Manual Installation and Deployment_, for detailed instructions.

## Manual Installation and Deployment

This section provides instructions for manually installing and deploying My File. These steps are equivalent to what the installation script performs.

### Installation

Clone the required My File repositories:

```bash
git clone https://github.com/newamericafoundation/na-my-file-infra.git
git clone https://github.com/newamericafoundation/na-my-file-api.git
git clone https://github.com/newamericafoundation/na-my-file-api-client.git
git clone https://github.com/newamericafoundation/na-my-file-client.git
```

### Deployment

1. Deploy the infrastructure:

   ```bash
   cd na-my-file-infra
   npm install
   npm run cdk-bootstrap
   npm run stack-deploy-dev
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

Congratulations! You have successfully deployed the My File repositories. The system should now be up and running.

## Next Steps

After successfully deploying My File, here are the recommended next steps:

### 1. Development Environment

We strongly recommend setting up a development environment first:

- Test your configurations in development before production
- See [Troubleshooting Guide](troubleshooting.md) if you encounter any issues

### 2. Customization

To adapt My File for your organization:

- Follow our [Customization Guide](Customization.md) to configure:
  - Organization details
  - Resource naming
  - Email templates
  - Frontend branding
  - Security settings

### 3. Further Resources

- Return to the [main documentation](index.md) for comprehensive project information
- Review individual repository documentation for detailed configuration options
- Check our [Roadmap](ROADMAP.md) for upcoming features and improvements

### 4. Getting Help

- Consult the [Troubleshooting Guide](troubleshooting.md) for common issues
- Open an issue in the appropriate repository for technical support
- Join the community discussions for best practices and tips

Happy document management & sharing with My File!
