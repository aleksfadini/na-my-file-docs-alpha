# My File Overview

## File Upload and Management System

This project is a file upload and management system designed to be adopted by non-profits and the Department of Homeless Services of NY. It consists of multiple repositories that work together to provide a comprehensive solution for uploading, storing, and managing documents from mobile devices and web browsers.

## Repositories

### na-my-file-api

This repository contains the backend API code for the file upload and management system. It is responsible for handling file uploads, storage, retrieval, and other file-related operations. The API is built using a modern web framework and follows industry best practices for security, scalability, and performance.

### na-my-file-api-client

The API client repository provides a client library or SDK that simplifies the interaction with the file upload API. It offers a convenient and intuitive interface for developers to integrate the file upload functionality into their own applications. The API client abstracts away the low-level details of making HTTP requests and handling responses, making it easier to consume the API services.

### na-my-file-client

This repository houses the frontend client application for the file upload system. It includes a user-friendly interface that allows users to upload, view, and manage their documents seamlessly. The client application is built using modern web technologies and frameworks, ensuring a responsive and interactive user experience across different devices and browsers. This application is built in React, using Typescript.

### na-my-file-core-sdk-pkg

The core SDK package repository contains shared code, utilities, and libraries that are used across multiple components of the project. It provides a centralized and reusable set of functionalities to maintain consistency and avoid duplication of code. This package can be easily imported and utilized by other repositories within the project.

### na-my-file-infra

This repository contains the infrastructure-as-code (IaC) definitions for provisioning and managing the necessary cloud resources for the file upload system. It utilizes AWS CDK (Cloud Development Kit) to define and deploy the required AWS services, such as storage buckets, serverless functions, and API gateways. The infrastructure code ensures a reproducible and scalable environment for the application.

### na-my-file-docs

The documentation repository serves as a central hub for all project-related documentation. It includes comprehensive setup and installation guides, user manuals, API references, and other essential information. The documentation repository aims to provide clear instructions and guidance for developers, administrators, and end-users to effectively use and contribute to the file upload system.

## Getting Started

To get started with the file upload and management system, please refer to the documentation repository (na-my-file-docs) for detailed instructions on setting up the development environment, configuring the necessary dependencies, and deploying the application. The documentation also provides examples and guides on how to use the various features and functionalities of the system.

## Contributing

My File welcomes contributions from the community to enhance and expand the capabilities of this project. If you'd like to contribute, please review the contribution guidelines outlined in the respective repositories and the documentation repository (na-my-file-docs). Feel free to submit bug reports, feature requests, or pull requests to help improve the project.

## License

This project is licensed under the MIT License. Please see the LICENSE file in each repository for more details.
