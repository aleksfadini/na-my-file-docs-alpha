# MyFile Front-End Documentation

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Technologies](#technologies)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Repository Structure](#repository-structure)
- [Testing](#testing)
  - [Unit Tests](#unit-tests)
  - [End-to-End Tests](#end-to-end-tests)
- [Deployment](#deployment)
  - [Manual Deployment](#manual-deployment)
  - [Automated Deployment](#automated-deployment)
- [Internationalization](#internationalization)
- [State Management](#state-management)
- [Form Handling](#form-handling)
- [PDF Viewing](#pdf-viewing)
- [Styling](#styling)
- [Contributing](#contributing)
- [License](#license)

## Overview

The `na-my-file-client` repository contains the front-end code for the MyFile web application. MyFile is a platform that allows users to securely upload, store, and share personal files and documents with agencies when applying for benefits. The application provides a user-friendly interface for managing documents and streamlining the application process for various services.

## Features

- User authentication and authorization using an Identity Provider (IdP)
- Secure file upload, storage, and sharing
- Integration with external services like Adobe Document Services
- Multilingual support for a wide range of languages
- Mobile-responsive design for optimal user experience on various devices
- Application creation and document checklist management
- User profile management and family member management
- Intuitive dashboard for easy navigation and access to documents and applications

## Technologies

The MyFile front-end is built using the following technologies:

- [React](https://reactjs.org/) - JavaScript library for building user interfaces
- [TypeScript](https://www.typescriptlang.org/) - Typed superset of JavaScript that compiles to plain JavaScript
- [Vite](https://vitejs.dev/) - Fast build tool and development server
- [Tailwind CSS](https://tailwindcss.com/) - Utility-first CSS framework for rapid UI development
- [Material UI](https://mui.com/) - React UI framework for prebuilt and customizable components
- [Zustand](https://github.com/pmndrs/zustand) - Lightweight state management library for React
- [react-hook-form](https://react-hook-form.com/) - Performant, flexible, and extensible forms library for React
- [react-pdf](https://github.com/wojtekmaj/react-pdf) - PDF viewer component for React
- [Vitest](https://vitest.dev/) - Fast and modern unit test framework
- [React Testing Library](https://testing-library.com/docs/react-testing-library/intro/) - Simple and complete React DOM testing utilities
- [Playwright](https://playwright.dev/) - Reliable end-to-end testing for modern web apps
- [GitHub Actions](https://github.com/features/actions) - Workflow automation for CI/CD pipelines

## Getting Started

### Prerequisites

Before running the MyFile front-end locally, ensure you have the following software installed:

- [Node.js](https://nodejs.org/) (version 14 or higher)
- [npm](https://www.npmjs.com/) (version 6 or higher)

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/na-my-file-client.git
   ```
2. Navigate to the project directory:
   ```
   cd na-my-file-client
   ```
3. Install the dependencies:
   ```
   npm install
   ```
4. Start the development server:
   ```
   npm run dev
   ```
5. Open your browser and visit `http://localhost:3000` to view the application.

## Repository Structure

The repository is structured as follows:

- `/src` - Contains the main application source code
  - `/assets` - Static assets such as images, mock data, and markdown content
  - `/components` - Reusable React components used throughout the application
  - `/i18n` - Internationalization configuration and translation files
  - `/layouts` - Common layout components like header, footer, and navigation
  - `/lib` - Utility libraries and helper functions
  - `/pages` - Top-level page components that represent different views of the application
  - `/store` - Zustand store slices for managing application state
  - `/types` - TypeScript type definitions for various entities and data structures
  - `/utils` - Utility functions used across the application
- `/public` - Contains the `index.html` template and other static files
- `/tests-examples` - Contains example test files for reference
- `/tests-playwright` - Contains end-to-end test files using Playwright
- Top-level configuration files for tools like ESLint, Prettier, Vite, PostCSS, and Husky

## Testing

### Unit Tests

The MyFile front-end uses Vitest and React Testing Library for unit testing. To run the unit tests, use the following command:

```
npm run test:vitest
```

### End-to-End Tests

End-to-end tests are implemented using Playwright. To run the end-to-end tests, use the following command:

```
npx playwright test
```

For more information on running tests with Playwright, refer to the [Playwright documentation](https://playwright.dev/docs/intro).

## Deployment

### Manual Deployment

The repository includes scripts to manually deploy the application to an AWS S3 bucket and invalidate the CloudFront distribution. To deploy the application manually:

1. Ensure you have the AWS CLI installed and configured with the necessary credentials.
2. Run the `params.env` file to set the required environment variables for your deployment target (dev, staging, prod).
3. Run one of the deploy scripts:
   - `npm run deploy-dev` for development environment
   - `npm run deploy-prod` for production environment
4. The script will build the application, upload the files to the configured S3 bucket, and create an invalidation for the CloudFront distribution to reflect the updates.

### Automated Deployment

The CI/CD pipeline is set up using Azure Pipelines to automatically build and deploy the application on pushes to the `dev` or `main` branch. The pipeline configuration can be found in the `azure-pipelines.yml` file.

## Internationalization

MyFile supports multiple languages to cater to a diverse user base. The internationalization setup is located in the `/src/i18n` directory. Language-specific translations are stored in separate files within the `/src/i18n/locales` directory.

To add support for a new language:

1. Create a new translation file in the `/src/i18n/locales` directory (e.g., `fr.js` for French).
2. Define the translations in the newly created file.
3. Update the `i18n.js` configuration file in `/src/i18n` to include the new language.

## State Management

The application uses Zustand for state management. Zustand is a lightweight and easy-to-use state management library for React. The store is divided into slices, each responsible for managing a specific portion of the application state. The store slices are located in the `/src/store` directory.

To add a new store slice:

1. Create a new file in the `/src/store` directory (e.g., `ExampleSlice.ts`).
2. Define the state interface, initial state, and actions in the new slice file.
3. Update the `store.ts` file to include the new slice in the `StoreTypeIntersection` and add it to the `useBoundStore` creation function.

## Form Handling

Form handling in MyFile is done using the `react-hook-form` library. It provides a simple and efficient way to manage form state, validation, and submission. Form components are located in the `/src/components` directory and are integrated with the respective page components.

## PDF Viewing

The application uses the `react-pdf` library to render PDF documents. The `PDFReader` component, located in `/src/components/PDFReader`, wraps the `react-pdf` functionality and provides a customizable PDF viewing experience.

## Styling

MyFile uses a combination of Tailwind CSS and Material UI for styling. Tailwind CSS is a utility-first CSS framework that allows for rapid UI development, while Material UI provides prebuilt and customizable React components. The styling configuration can be found in the `tailwind.config.ts` file and the `MUITheme.tsx` file.

## Contributing

Contributions to the MyFile front-end are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request. Make sure to follow the existing code style and conventions.

## License

The MyFile front-end is open-source software licensed under the [MIT license](https://opensource.org/licenses/MIT). Feel free to use, modify, and distribute the code as per the terms of the license.
