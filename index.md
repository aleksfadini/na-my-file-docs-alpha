# Welcome to _My File_!

Welcome to _My File_! This is the documentation hub, where you can orient yourself and find out how to use, deploy, modify, or simply learn more about _My File_.

## What is _My File_?

_My File_ is a document storage and sharing mobile-first website developed, managed, and piloted by New America. It provides residents of a jurisdiction a safe and secure place to manage their family's vital documents. _My File_ makes it easy to decide what documents to share and unshare and decide who to share the documents with.

### Key Features

- Upload and manage secure, encrypted backups of vital documents like ID cards, social security cards, utility bills, etc.
- View, download or delete anytime.
- Share when applying for temporary shelter, housing or any other service.
- Administrators can sort, download and update the status of documents.

### Open Source and Available for All Jurisdictions

_My File_ is an open source project, which means that the source code is publicly available and can be freely used, modified, and distributed by anyone. We believe that every jurisdiction should have access to a powerful tool like _My File_ to help their residents securely store and share important documents.

We encourage government agencies, non-profit organizations, and developers from any jurisdiction to take advantage of the _My File_ open source project. By adopting and customizing _My File_ to meet the specific needs of your community, you can provide your residents with a valuable service that can help streamline access to essential services and support. Reach out to us if you are using _My File_!

## Getting Started

To get started with the file upload and management system, please refer to the [Quickstart Guide](quickstart.md) for detailed instructions on setting up the development environment, configuring the necessary dependencies, and deploying the application. The documentation also provides examples and guides on how to use the various features and functionalities of the system.

## Repositories and Project Structure

_My File_ follows a modern modular architecture, with the project divided into six independent repositories. Each repository serves a specific purpose and can be developed, deployed, and used independently, providing flexibility for developers and jurisdictions to adopt the components that best suit their needs.

While each repository can stand on its own, they work together seamlessly to create the complete _My File_ solution. Developers are encouraged to explore the individual repositories and utilize the components that align with their requirements.

_Note: For this reason, each repository maintains its own comprehensive documentation, detailing its functionality, setup process, and usage instructions._

### na-my-file-docs

The documentation repository serves as a central hub for all project-related documentation. It includes comprehensive setup and installation guides, user manuals, API references, and other essential information. The documentation repository aims to provide clear instructions and guidance for developers, administrators, and end-users to effectively use and contribute to the file upload system.

### na-my-file-infra

This repository contains the infrastructure-as-code (IaC) definitions for provisioning and managing the necessary cloud resources for the file upload system. It utilizes Amazon Web Service (AWS) CDK (Cloud Development Kit) to define and deploy the required AWS services, such as storage buckets, serverless functions, and API gateways. The infrastructure code ensures a reproducible and scalable environment for the application.
You can learn more about the infrastructure [here](infra.md).

### na-my-file-api

This repository contains the backend API code for the file upload and management system. It is responsible for handling file uploads, storage, retrieval, and other file-related operations. The API is built using a modern web framework and follows industry best practices for security, scalability, and performance.
You can learn more about the API [here](api.md).

### na-my-file-api-client

The API client repository provides a client library or SDK that simplifies the interaction with the file upload API. It offers a convenient and intuitive interface for developers to integrate the file upload functionality into their own applications. The API client abstracts away the low-level details of making HTTP requests and handling responses, making it easier to consume the API services.
You can learn more about the API client [here](api-client.md).

### na-my-file-client

This repository houses the frontend client application for the file upload system. It includes a user-friendly interface that allows users to upload, view, and manage their documents seamlessly. The client application is built using modern web technologies and frameworks, ensuring a responsive and interactive user experience across different devices and browsers. This application is built in React, using Typescript.
To learn more about the client application, deploy it separately or customize it, follow the link [here](client.md).

## Other Documentation Pages

### Amazon Web Service (AWS) Setup

The easiest option to deploy the _My File_ requires an account with Amazon Web Service (AWS). If you want to learn more about setting up an account and an AWS profile, you can read a complete list [here](aws-setup.md).

### Tech Stack

If you want to learn more about all of the components, programs and technologies used by _My File_, you can read a complete list [here](techstack.md).

## Contributing

_My File_ welcomes contributions from the community to enhance and expand the capabilities of this project. If you'd like to contribute, please review the contribution guidelines outlined in the respective repositories and the documentation repository (na-my-file-docs). Feel free to submit bug reports, feature requests, or pull requests to help improve the project.

## License

This project is open-source software licensed under the [MIT license](https://opensource.org/licenses/MIT). Feel free to use, modify, and distribute the code as per the terms of the license.

## Additional Resources

### Customization Guide

Want to adapt My File for your organization? Our [Customization Guide](Customization.md) provides comprehensive instructions for:

- Branding and styling
- Resource naming
- Email templates
- Environment configurations
- Security settings

### Troubleshooting

Encountering issues? Check our [Troubleshooting Guide](troubleshooting.md) for:

- Common deployment issues
- Permission problems
- Resource naming conflicts
- Environment setup solutions

### Future Development

Interested in My File's future? Our [Roadmap](roadmap.md) outlines:

- Current limitations
- Planned improvements
- Implementation priorities
- Areas needing contribution

We encourage you to explore these resources and contribute to the project's growth. For any questions or suggestions, please open an issue in the appropriate repository.
