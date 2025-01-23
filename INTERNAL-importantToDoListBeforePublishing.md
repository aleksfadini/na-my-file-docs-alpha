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
