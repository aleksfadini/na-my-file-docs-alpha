# Important Items To Check Before Publishing The Docs Repo To New America GitHub Page

## Last Minute - REQUIRED

### Delete Internal Docs

- [ ] Delete this doc (INTERNAL-importantToDoListBeforePublishing.md)

### Best Replication Goals

- [ ] Discuss next steps
- [ ] rename bucket to include unique name: na-my-file-infra-bucket-newamerica-web-ui-{dev|prod}
- [ ] rename bucket to include unique name: na-my-file-infra-bucket-web-openapi-{dev|prod}
- [ ] rename bucket to include unique name: na-my-file-infra-na-user-pool-domain-dev
- [ ] rename bucket to include unique name: na-my-file-na-myfile-documents-bucket-{env} (from api repo)
- [ ] Update install script `deploy.sh` to actual GH NA repositories instead of aleksfadini
- [ ] make alpha repo public
- [ ] vomit out the url to visit taken from aws cli

## Adapting And Finetuning Scripts

### Build Scripts

- [ ] Create and build script `deploy-dev.sh`
- [x] Create and build script `deploy-prod.sh`

## Testing Scripts

### Test Everything One More Time

Also, time the installation and deployments

- [ ] Final test for `deploy-dev.sh`
- [x] Final test for `deploy-prod.sh`

## Other

- [ ] Check/describe My File using the shared slides copy
- [ ] Add paragraph about needing more debugging

# WEAK POINTS:

Make sure user has all permissions correctly, such in AWS_PROFILE=my-file-test aws iam list-attached-user-policies --user-name MyFileDeploymentTest
{
"AttachedPolicies": [
{
"PolicyName": "AmazonAPIGatewayAdministrator",
"PolicyArn": "arn:aws:iam::aws:policy/AmazonAPIGatewayAdministrator"
},
{
"PolicyName": "CloudFrontFullAccess",
"PolicyArn": "arn:aws:iam::aws:policy/CloudFrontFullAccess"
},
{
"PolicyName": "AmazonSSMFullAccess",
"PolicyArn": "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
},
{
"PolicyName": "AmazonEC2FullAccess",
"PolicyArn": "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
},
{
"PolicyName": "IAMFullAccess",
"PolicyArn": "arn:aws:iam::aws:policy/IAMFullAccess"
},
{
"PolicyName": "AmazonElastiCacheFullAccess",
"PolicyArn": "arn:aws:iam::aws:policy/AmazonElastiCacheFullAccess"
},
{
"PolicyName": "AmazonS3FullAccess",
"PolicyArn": "arn:aws:iam::aws:policy/AmazonS3FullAccess"
},
{
"PolicyName": "AWSCloudFormationFullAccess",
"PolicyArn": "arn:aws:iam::aws:policy/AWSCloudFormationFullAccess"
},
{
"PolicyName": "AWSLambda_FullAccess",
"PolicyArn": "arn:aws:iam::aws:policy/AWSLambda_FullAccess"
}
]
}
