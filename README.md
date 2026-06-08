# Terraform AWS EC2 Automation with Jenkins

## Overview

This project automates the provisioning and destruction of AWS EC2 infrastructure using Terraform and Jenkins.

The Jenkins pipeline performs the following tasks:

1. Initialize Terraform
2. Validate Terraform configuration
3. Generate an execution plan
4. Apply infrastructure changes
5. Destroy infrastructure after manual approval
6. Clean up Jenkins workspace

---

## Prerequisites

* AWS Account
* Jenkins Server
* Terraform installed on Jenkins agent
* AWS IAM User with appropriate permissions
* AWS Access Key and Secret Key stored in Jenkins Credentials
* Git repository containing Terraform code

---

## Project Structure

```text
.
├── Jenkinsfile
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── terraform.tfvars
└── README.md
```

---

## Jenkins Credentials

Create the following credentials in Jenkins:

| Credential ID         | Description    |
| --------------------- | -------------- |
| AWS_ACCESS_KEY_ID     | AWS Access Key |
| AWS_SECRET_ACCESS_KEY | AWS Secret Key |

---

## Terraform Commands

### Initialize

```bash
terraform init
```

### Validate

```bash
terraform validate
```

### Plan

```bash
terraform plan
```

### Apply

```bash
terraform apply -auto-approve
```

### Destroy

```bash
terraform destroy -auto-approve
```

---

## Jenkins Pipeline Stages

### 1. Checkout

Pulls source code from Git repository.

### 2. Terraform Init

Initializes Terraform backend and providers.

### 3. Terraform Validate

Validates Terraform configuration syntax.

### 4. Terraform Plan

Creates an execution plan.

### 5. Terraform Apply

Creates AWS resources.

### 6. Approval Stage

Requires manual approval before infrastructure destruction.

### 7. Terraform Destroy

Removes AWS resources managed by Terraform.

### 8. Workspace Cleanup

Deletes Jenkins workspace after execution.

---

## Troubleshooting

### Terraform Destroy Shows "0 Resources Destroyed"

Example:

```text
No changes. No objects need to be destroyed.
Destroy complete! Resources: 0 destroyed.
```

Possible causes:

* Terraform state file is missing
* Wrong Terraform workspace
* Incorrect backend configuration
* Resources were deleted manually
* Jenkins workspace cleanup removed local state

Check:

```bash
terraform state list
terraform workspace show
terraform show
```

---

## AWS Verification

Verify running EC2 instances:

```bash
aws ec2 describe-instances \
  --query 'Reservations[*].Instances[*].[InstanceId,State.Name]' \
  --output table
```

---

## Security Notes

* Never commit AWS credentials to Git.
* Store secrets in Jenkins Credentials Manager.
* Use remote Terraform state (S3 + DynamoDB locking) for production workloads.
* Apply least-privilege IAM permissions.

---

## Author

Infrastructure Automation Project using Terraform, Jenkins, and AWS.
