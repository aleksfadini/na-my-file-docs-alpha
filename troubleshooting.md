# Troubleshooting Guide for My File Deployment

## Common Issues and Solutions

### 1. Permission Issues

#### Symptom

Deployment fails with AWS permission errors like:

```bash
User: arn:aws:iam::123456789012:user/username is not authorized to perform: s3:CreateBucket
```

#### Solution

1. Verify your AWS credentials:

```bash
aws sts get-caller-identity --profile my-file-test
```

2. Ensure your IAM user has the necessary permissions. Add these policies:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:*",
        "cloudformation:*",
        "cloudfront:*",
        "rds:*",
        "ec2:*",
        "secretsmanager:*",
        "ssm:*",
        "iam:*",
        "lambda:*",
        "apigateway:*"
      ],
      "Resource": "*"
    }
  ]
}
```

### 2. Resource Name Conflicts

#### Symptom

Deployment fails with errors like:

```bash
S3 bucket already exists: na-myfile-documents-bucket-dev
```

#### Solution

1. Check existing resources:

```bash
# Check S3 buckets
aws s3api list-buckets --query 'Buckets[?contains(Name, `na-myfile`)]' --profile my-file-test

# Check CloudFormation stacks
aws cloudformation list-stacks --profile my-file-test \
    --query 'StackSummaries[?contains(StackName, `na-my-file`)]'
```

2. Modify resource names in `params.env`:

```bash
# Add a unique identifier
export ORG_NAME_ABBV="myfiletest2"  # Change this to be unique
export CLIENT_FILE_BUCKET_NAME="na-myfile-documents-bucket-${ORG_NAME_ABBV}-${DEPLOYMENT_TARGET}"
```

### 3. SSM Parameter Not Found

#### Symptom

```bash
An error occurred (ParameterNotFound) when calling the GetParameter operation
```

#### Solution

1. Check existing parameters:

```bash
aws ssm get-parameters-by-path \
    --path "/" \
    --recursive \
    --profile my-file-test \
    --region us-east-1 \
    --query 'Parameters[?contains(Name, `na-my-file`)]'
```

2. Ensure parameter names match in both infrastructure and API:

```bash
# In na-my-file-api/params.env
export POSTGRES_SECRET_ARN=$(aws ssm get-parameter --name "db-main-secret-arn-myfiletest-${DEPLOYMENT_TARGET}" --query "Parameter.Value" --output text)
```

### 4. RDS Secret Issues

#### Symptom

```bash
Error: must use only one of `secretCompleteArn` or `secretPartialArn`
```

#### Solution

1. Clean up existing secrets:

```bash
# List secrets
aws secretsmanager list-secrets \
    --profile my-file-test \
    --region us-east-1 \
    --query 'SecretList[?contains(Name, `na-my-file`) || contains(Name, `postgres`)]'

# Delete if necessary
aws secretsmanager delete-secret \
    --secret-id "secret-name" \
    --force-delete-without-recovery \
    --profile my-file-test \
    --region us-east-1
```

2. Wait 5 minutes after deletion before redeploying

### 5. VPC Issues

#### Symptom

Infrastructure deployment fails looking for VPC parameters

#### Solution

1. Comment out VPC lookup in `na-my-file-infra/params.env`:

```bash
# Comment out this line
# export VPC_ID=$(aws ssm get-parameter --name "aidpp-vpcid-$DEPLOYMENT_TARGET" --query "Parameter.Value" --output text)
```

2. Let the stack create a new VPC

### 6. Complete Cleanup

The repository includes a cleanup script that helps remove all resources. To use it:

```bash
./cleanup.sh
```

This script will:

1. List all resources for review (CloudFormation stacks, Secrets, SSM Parameters, S3 buckets, RDS instances, Lambda functions)
2. Prompt for confirmation before deletion
3. Clean up resources in the correct order to avoid dependency issues

For reference, see the cleanup script implementation here:

```shell:na-my-file-docs-alpha/cleanup.sh
startLine: 107
endLine: 131
```

## Best Practices

1. Always run cleanup script before fresh deployment
2. Wait 5-10 minutes after cleanup before redeploying
3. Check AWS Console for any remaining resources
4. Use unique identifiers for your deployment
5. Keep track of created resources using tags

## Common AWS CLI Commands for Troubleshooting

```bash
# Check AWS identity
aws sts get-caller-identity --profile my-file-test

# List all resources with specific tags
aws resourcegroupstaggingapi get-resources \
    --tag-filters Key=Project,Values=na-my-file \
    --profile my-file-test

# Check CloudWatch logs
aws logs describe-log-groups \
    --log-group-name-prefix "/aws/lambda/na-my-file" \
    --profile my-file-test
```

Need more help? Contact the platform team or refer to the AWS documentation.

## Open Source Deployment Considerations

When deploying this open source project, keep in mind:

1. Resource Naming

- All resource names include a prefix (e.g., `na-my-file-`)
- Add your own unique identifier to avoid conflicts
- See the internal documentation for naming conventions:

```markdown:na-my-file-docs-alpha/INTERNAL-importantToDoListBeforePublishing.md
startLine: 11
endLine: 15
```

2. AWS Profile Setup

- Create a dedicated AWS profile for the project
- Required permissions are documented in:

```markdown:na-my-file-docs-alpha/INTERNAL-importantToDoListBeforePublishing.md
startLine: 42
endLine: 82
```

3. Infrastructure Components
   The project uses multiple AWS services as documented in:

```markdown:na-my-file-infra/README.md
startLine: 24
endLine: 31
```

4. Deployment Order
   Follow the quickstart guide's deployment order to ensure dependencies are met:

```markdown:na-my-file-docs-alpha/quickstart.md
startLine: 64
endLine: 95
```
