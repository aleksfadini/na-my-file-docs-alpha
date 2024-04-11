# na-my-file-core-sdk-pkg

## Short Description

### Project Overview

The `na-my-file-core-sdk-pkg` repository contains a core SDK package for the MyFile application, written in TypeScript. It provides utility functions, middleware, and interfaces to assist with building APIs and services for the MyFile platform.

### Key Functionality

- Defines interfaces and types for route configuration, request/response schemas and objects, JWT tokens, permissions, etc.
- Provides utility functions for tasks such as parsing JWTs, authorizing routes, and handling errors.
- Implements middleware for schema validation using Joi and JWT validation.
- Enables generation of Swagger/OpenAPI specs from route schemas defined using Joi.
- Has a module for parsing/modifying CloudFormation YAML templates.
- Main entry point is `src/index.ts`, which exports the key interfaces and functions.

### Project Structure

- Source code is located in the `src/` directory, with subdirectories for executables and lib.
- The `lib/` directory contains the core interfaces, types, middleware, and utility modules.
- The package is bundled and generated into a `dist/` directory when built.
- Contains shell scripts under `_devops_scripts/` for CI/CD tasks like deploying to S3.
- Uses a standard Node.js project structure with `package.json` defining dependencies and scripts.

### Dependencies

- Uses Joi for schema validation
- Relies on `joi-to-swagger` and `joi-to-typescript` for generating OpenAPI specs and TypeScript types from Joi schemas
- Depends on various AWS SDK packages like `aws-lambda` and auth libraries like `atob`
- Uses Jest and `ts-jest` for testing
- Utilizes Prettier and `lint-staged` for linting and code formatting
- Bundles the package with esbuild

### Configuration

- The shell scripts under `_devops_scripts/` reference some environment variables for deployment configuration

### Testing

- Has a "test" script in `package.json`.

### Conclusion

The `na-my-file-core-sdk-pkg` is a useful core package for sharing functionality across Node.js/TypeScript APIs and services in the MyFile platform. It encapsulates common logic for route configuration, authorization, validation, documentation generation, and more. It enforces consistency and reduces duplication across services in the MyFile ecosystem.

# Extended Documentation

## Table of Contents

1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Usage](#usage)
   - [Configuration](#configuration)
   - [Middleware](#middleware)
   - [Utilities](#utilities)
   - [Executables](#executables)
4. [API Reference](#api-reference)
   - [Interfaces and Types](#interfaces-and-types)
   - [Functions](#functions)
   - [Classes](#classes)
5. [Testing](#testing)
6. [Contributing](#contributing)
7. [License](#license)

## Introduction

The `na-my-file-core-sdk-pkg` is a core SDK package for the MyFile application, written in TypeScript. It provides a collection of utility functions, middleware, and interfaces to assist with building APIs and services for the MyFile platform. This package aims to encapsulate common logic and promote code reuse across various services within the MyFile ecosystem.

## Installation

To install the `na-my-file-core-sdk-pkg`, use the following command:

```bash
npm install na-my-file-core-sdk-pkg
```

## Usage

### Configuration

The package does not currently include any application-level configuration files. However, the shell scripts located in the `_devops_scripts/` directory reference environment variables for deployment configuration.

### Middleware

The `na-my-file-core-sdk-pkg` provides middleware functions for common tasks such as schema validation and JWT validation.

#### Schema Validation Middleware

The schema validation middleware uses Joi to validate request parameters, query strings, and request bodies against predefined schemas. To use the middleware, first define your schemas using Joi, then pass them to the `schemaValidationMiddleware` function:

```typescript
import { schemaValidationMiddleware } from "na-my-file-core-sdk-pkg";
import Joi from "joi";

const requestSchema = {
  body: Joi.object({
    name: Joi.string().required(),
    email: Joi.string().email().required(),
  }),
};

const validateRequest = schemaValidationMiddleware(requestSchema);
```

#### JWT Validation Middleware

The JWT validation middleware verifies the presence and validity of a JWT token in the `Authorization` header of a request. To use the middleware, simply import and apply the `jwtValidationMiddleware` function:

```typescript
import { jwtValidationMiddleware } from "na-my-file-core-sdk-pkg";

const validateJWT = jwtValidationMiddleware;
```

### Utilities

The `na-my-file-core-sdk-pkg` offers various utility functions to help with common tasks.

#### Parsing JWTs

The `parseJwt` function allows you to easily decode a JWT token and extract its payload:

```typescript
import { parseJwt } from "na-my-file-core-sdk-pkg";

const token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...";
const decodedToken = parseJwt(token);
console.log(decodedToken.email);
```

#### Authorizing Routes

The `authorizeRoute` function helps with authorizing routes based on the presence of a valid JWT token:

```typescript
import { authorizeRoute } from "na-my-file-core-sdk-pkg";

const event = {
  // ... Lambda event object
};

try {
  await authorizeRoute(event);
  // Route is authorized
} catch (error) {
  // Route is not authorized
}
```

#### Handling Errors

The `CustomError` class can be used to create custom error objects with specific HTTP status codes and messages:

```typescript
import { CustomError } from "na-my-file-core-sdk-pkg";

throw new CustomError("Invalid request", 400);
```

### Executables

The `na-my-file-core-sdk-pkg` includes an executable script for updating YAML files in-place:

```bash
npx update-yaml-inplace --pathToYaml /path/to/file.yaml --propertyPath 'path.to.property' --propertyValue 'new value'
```

## API Reference

### Interfaces and Types

The package exports several interfaces and types to help define route configurations, request/response schemas, and more. Some of the key interfaces include:

- `RouteConfig`: Defines the configuration for a set of routes, including authorization settings and individual route entries.
- `ConfigRouteEntry`: Represents a single route entry within a `RouteConfig`, specifying the path, HTTP method, handler location, and other metadata.
- `RouteSchema`: Defines the schema for request parameters, query strings, request bodies, and response bodies using Joi schemas.
- `RouteArguments`: Represents the incoming arguments for a route handler, including request parameters, query strings, request body, and more.
- `RouteModule`: Encapsulates a route handler chain and its associated schema.

For a complete list of interfaces and types, please refer to the `src/lib/types-and-interfaces.ts` file.

### Functions

The `na-my-file-core-sdk-pkg` exports several functions for various purposes:

- `parseJwt`: Decodes a JWT token and returns its payload.
- `authorizeRoute`: Authorizes a route based on the presence of a valid JWT token in the request headers.
- `schemaValidationMiddleware`: Creates a middleware function for validating request parameters, query strings, and request bodies against Joi schemas.
- `jwtValidationMiddleware`: A middleware function for validating the presence and validity of a JWT token in the request headers.
- `generateRouteSwaggerSpec`: Generates a Swagger/OpenAPI specification for a route based on its Joi schema and other metadata.
- `updateCFYamlPropertyInplace`: Updates a property within a CloudFormation YAML template file.

For more details on each function, please refer to their respective source files in the `src/lib/` directory.

### Classes

The package exports the following classes:

- `CustomError`: Extends the built-in `Error` class to include an HTTP status code and a custom error message.

## Testing

The `na-my-file-core-sdk-pkg` includes a "test" script in the `package.json` file, but the tests directory appears to be missing. Adding unit tests, particularly for the core utility functions and middleware, is highly recommended to ensure the reliability and maintainability of the package.

## Contributing

Contributions to the `na-my-file-core-sdk-pkg` are welcome! If you find a bug, have a feature request, or wish to submit a pull request, please follow the guidelines outlined in the CONTRIBUTING.md file.

When contributing to this package, please ensure that your code adheres to the existing style and conventions, and that any new features or changes are thoroughly tested and documented.

## License

The `na-my-file-core-sdk-pkg` is proprietary software, and its usage is subject to the terms and conditions specified by the MyFile organization. For more information, please contact the package maintainers or the MyFile legal department.
