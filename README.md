# Setting up AMI ACM with Terraform

Creates all the required certificates for AMI using Terraform

## Pre Requisites

1. **Pre-Commit Git Hook**: Install `pre-commit`. Visit https://pre-commit.com/. This is used to clean up the code before commiting to git.
2. **AWS Secret Scanner**: Install git-secrets. Visit https://github.com/awslabs/git-secrets. This is used to scan for aws credentials before a commit occurs.
3. **Terraform**: v0.11 Installed
4. **Execute AMI-Security**: Run [AMI-Security Terraform module](https://github.com/galileoinsights-ami/terraform-ami-security)
5. Setup Environment specific setup scripts (setup-$ENV.sh)

## Setup Environment Variable

Following Environment Variables need to be setup in the environment specific setup script.

Variable Name | Description | Required? | Example Values
---|---|---|---
ENV | The environment of this AWS Setup | Yes | dev, prod
AWS_ACCESS_KEY_ID | AWS Access key of user `TFCertificateManager` | Yes |
AWS_SECRET_ACCESS_KEY | AWS Access Secret Key of user `TFCertificateManager` | Yes |
AWS_DEFAULT_REGION | The AWS Region to work with | Yes | us-east-2
TF_VAR_backend_s3_bucket_name | The S3 Terraform Backend Bucket | Yes | ami-terraform-configs

## Before Committing

1. Scan for Secrets in to be committed files

```
git secrets --scan -r
git secrets --scan --cached --no-index --untracked
```

## Executing Terraform

Execute `deploy.sh` file

```
export ENV="dev"; ./deploy.sh
```