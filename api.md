# My File: API

## Purpose and Functionality:

- This repository contains the core API for My File
- It provides routes and handlers for managing users, user files, cases, workflows, user family members, case applicants, and more.
- The API is built using Node.js, Express, and Prisma ORM with a PostgreSQL database.

## Key Observations:

1. The API follows a lambda-proxy pattern, with a main `lambda-proxy.ts` file that serves as the entry point. It loads route configurations from `routes-config.ts` and maps them to individual route handler files.

2. Route handlers are organized into separate files under the `src/routes` directory, grouped by resource type (e.g. users, cases, files). Each handler defines its own request/response schemas using Joi.

3. Prisma is used as the ORM to interact with the PostgreSQL database. The Prisma schema is defined in `prisma/schema.prisma`. Migrations are stored under `prisma/migrations`.

4. The `src/lib` directory contains shared utility modules, middleware, data access functions, and type/interface definitions used across route handlers.

5. Environment-specific configuration is loaded from `.env` files using the `dotenv` library. Sensitive config like DB credentials are stored in AWS Secrets Manager.

6. AWS CDK is used to define the infrastructure. The main stack is in `infra/lib/cdk-stack.ts`. It provisions the lambda function for the API, sets up API Gateway HTTP proxy integration, and a VPC.

7. GitHub Actions workflows under `.github/workflows` automate CI/CD pipelines for building, testing and deploying the API.

8. The code follows best practices with proper error handling, input validation using schemas, and modular structure.
