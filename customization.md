# Customizing My File

This guide explains how to customize My File for your organization. We'll cover branding, configuration, and data model customization.

## Organization Details

1. Update `params.env` in each repository:

```bash:na-my-file-infra/params.env
# Organization Details
export ORG_NAME="Your Organization Name"
export ORG_NAME_ABBV="yourorg"  # Used in resource naming
export BUSINESS_UNIT="Your Department"
export TECHNICAL_CONTACT="tech@example.com"
```

2. Update API configuration in `na-my-file-api/infra/config.ts`:

```typescript
startLine: 28;
endLine: 41;
```

## Resource Naming

Update bucket names and resources in `params.env` files:

```bash:na-my-file-api/params.env
# Customize bucket names with your organization prefix
export CLIENT_FILE_BUCKET_NAME="yourorg-documents-bucket-$DEPLOYMENT_TARGET"
```

See the internal documentation for all resources that need unique names:

```markdown:na-my-file-docs-alpha/INTERNAL-importantToDoListBeforePublishing.md
startLine: 11
endLine: 15
```

## Data Model Customization

1. Update database schema in `na-my-file-api/prisma/schema.prisma`
2. Update API types in `na-my-file-api/src/types`
3. Update validation schemas in `na-my-file-api/src/schemas`

## Email Templates and Notifications

1. Update email constants in `na-my-file-api/src/constants.ts`:

```typescript
export const EMAIL_CONFIG = {
  FROM_ADDRESS: "noreply@yourorg.com",
  ADMIN_NOTIFICATION_ADDRESS: "admin@yourorg.com",
  SUPPORT_ADDRESS: "support@yourorg.com",
};

export const EMAIL_TEMPLATES = {
  DOCUMENT_UPLOADED: {
    subject: "New Document Upload - Your Organization",
    template: "document-upload",
  },
  // Add more email templates
};
```

2. Update email templates in `na-my-file-api/src/templates`

## Frontend Customization

1. Update branding in `na-my-file-client/src/config/branding.ts`:

```typescript
export const BRANDING = {
  orgName: "Your Organization",
  logo: "/assets/your-logo.svg",
  primaryColor: "#YOUR_COLOR",
  favicon: "/favicon.ico",
};
```

2. Replace logo and favicon in `na-my-file-client/public/assets/`

## Environment Configuration

Each environment (dev, prod) can have different configurations:

1. Infrastructure (`na-my-file-infra/params.env`):

```bash
# Development
export DEPLOYMENT_TARGET="dev"
export DOMAIN_NAME="dev.yourorg.com"

# Production
export DEPLOYMENT_TARGET="prod"
export DOMAIN_NAME="docs.yourorg.com"
```

2. API Configuration (`na-my-file-api/params.env`):

```bash
# Environment-specific settings
export API_RATE_LIMIT="100"  # Requests per minute
export MAX_FILE_SIZE="10"    # In MB
```

## Security Customization

1. Update CORS settings in `na-my-file-api/infra/lib/cdk-stack.ts`
2. Modify authentication settings in Cognito stack
3. Update IAM policies as needed

## Advanced Customization

1. Infrastructure Stacks:

```markdown:na-my-file-infra/README.md
startLine: 71
endLine: 81
```

2. API Features:

```markdown:na-my-file-docs-alpha/api.md
startLine: 18
endLine: 28
```

## Testing Your Customization

1. Deploy to development environment first:

```markdown:na-my-file-docs-alpha/quickstart.md
startLine: 64
endLine: 71
```

2. Verify all customizations work as expected
3. Run the test suite for each component
4. Deploy to production only after thorough testing

Remember to update all relevant documentation to reflect your customizations.
