#!/bin/bash

# Set your AWS profile and region
PROFILE="my-file-test"
REGION="us-east-1"

echo "Starting cleanup..."

echo "Deleting CloudFormation stacks..."
# Get all stacks except CDK toolkit stack
for stack in $(aws cloudformation list-stacks --profile $PROFILE --region $REGION \
    --query 'StackSummaries[?StackStatus!=`DELETE_COMPLETE` && !contains(StackName, `CDKToolkit`)].StackName' --output text); do
    echo "Deleting stack: $stack"
    # First remove stack protection if it exists
    aws cloudformation update-termination-protection --no-enable-termination-protection \
        --stack-name $stack --profile $PROFILE --region $REGION 2>/dev/null || true
    
    # Try to delete the stack
    aws cloudformation delete-stack --stack-name $stack --profile $PROFILE --region $REGION
    
    # Wait for stack deletion
    echo "Waiting for stack $stack to be deleted..."
    aws cloudformation wait stack-delete-complete --stack-name $stack --profile $PROFILE --region $REGION
done

echo "Deleting RDS instances..."
for db in $(aws rds describe-db-instances --profile $PROFILE --region $REGION \
    --query 'DBInstances[].DBInstanceIdentifier' --output text); do
    echo "Deleting RDS instance: $db"
    # Disable deletion protection
    aws rds modify-db-instance --db-instance-identifier $db \
        --no-deletion-protection --profile $PROFILE --region $REGION
    
    # Delete the instance without final snapshot
    aws rds delete-db-instance --db-instance-identifier $db \
        --skip-final-snapshot --profile $PROFILE --region $REGION
    
    echo "Waiting for RDS instance $db to be deleted..."
    aws rds wait db-instance-deleted --db-instance-identifier $db \
        --profile $PROFILE --region $REGION
done

echo "Deleting S3 buckets..."
for bucket in $(aws s3api list-buckets --profile $PROFILE \
    --query 'Buckets[].Name' --output text); do
    # Skip CDK toolkit bucket
    if [[ $bucket == cdk-* ]]; then
        echo "Skipping CDK bucket: $bucket"
        continue
    fi
    
    echo "Cleaning bucket: $bucket"
    # Delete all versions (including delete markers)
    aws s3api list-object-versions --bucket $bucket --profile $PROFILE \
        --query 'Versions[].{Key:Key,VersionId:VersionId}' --output text 2>/dev/null | while read -r key versionId; do
        echo "Deleting object: $key (version $versionId)"
        aws s3api delete-object --bucket $bucket --key "$key" --version-id "$versionId" --profile $PROFILE
    done
    
    # Delete delete markers
    aws s3api list-object-versions --bucket $bucket --profile $PROFILE \
        --query 'DeleteMarkers[].{Key:Key,VersionId:VersionId}' --output text 2>/dev/null | while read -r key versionId; do
        echo "Deleting delete marker: $key (version $versionId)"
        aws s3api delete-object --bucket $bucket --key "$key" --version-id "$versionId" --profile $PROFILE
    done
    
    echo "Deleting bucket: $bucket"
    aws s3 rb s3://$bucket --force --profile $PROFILE
done

echo "Deleting Lambda functions..."
for func in $(aws lambda list-functions --profile $PROFILE --region $REGION \
    --query 'Functions[].FunctionName' --output text); do
    echo "Deleting function: $func"
    aws lambda delete-function --function-name $func --profile $PROFILE --region $REGION
done

echo "Cleanup complete!"
