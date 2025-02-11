# Contributing to My File

Thank you for your interest in contributing to My File! This document provides guidelines and information for contributors.

## Code of Conduct

By participating in this project, you agree to maintain a respectful and inclusive environment. We follow standard open source code of conduct practices.

## Getting Started

1. Fork the repository
2. Clone your fork
3. Set up the development environment following our [Quickstart Guide](quickstart.md):

## Development Process

### 1. Branching Strategy

- `main` - production-ready code
- `develop` - integration branch for features
- `feature/*` - for new features
- `fix/*` - for bug fixes

### 2. Environment Setup

See the complete [Infrastructure Setup Guide](../na-my-file-infra/README.md)

### 3. Code Style

- Use TypeScript for all new code
- Follow existing patterns in the codebase
- Use ESLint and Prettier configurations provided
- Document all public APIs and complex logic
- Write unit tests for new features

### 4. Testing

Before submitting a PR:

1. Run unit tests
2. Run integration tests
3. Test deployment in a dev environment
4. Verify customization options still work

See our [Customization Guide](customization.md) for details.

### 5. Pull Request Process

1. Create a feature branch from `develop`
2. Make your changes
3. Update documentation
4. Submit PR with:
   - Clear description
   - Issue reference
   - Test results
   - Screenshots (if UI changes)

### 6. Documentation

- Update relevant markdown files
- Document new features
- Update troubleshooting guide if needed
- Add examples for significant features

## Infrastructure Contributions

When modifying infrastructure:

1. Follow AWS best practices
2. Update all environment configurations
3. Test in isolated environment first
4. Document changes in architecture diagrams

For details, see our [Infrastructure Documentation](../na-my-file-infra/README.md)

## Security

- Never commit sensitive information
- See our complete [Security Features Guide](../na-my-file-infra/README.md#security-features)

## Future Improvements

Before starting major changes, review our [Project Roadmap](roadmap.md)

## Getting Help

1. Check existing documentation
2. Search closed issues
3. Open new issue with:
   - Clear description
   - Environment details
   - Steps to reproduce
   - Expected vs actual results

## Review Process

1. Code review required for all changes
2. Infrastructure changes need additional review
3. Documentation updates reviewed for clarity
4. All tests must pass
5. No merge conflicts with `develop`

## Release Process

1. Merge to `develop`
2. Test in staging environment
3. Create release PR to `main`
4. Tag release with semantic version
5. Update changelog

## Recognition

Contributors will be added to:

1. GitHub contributors list
2. CONTRIBUTORS.md file
3. Release notes for significant contributions

Thank you for contributing to My File!
