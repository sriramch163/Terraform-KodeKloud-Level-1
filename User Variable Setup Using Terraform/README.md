# User Variable Setup Using Terraform

## Objective

The objective of this task is to automate the creation of an AWS IAM User named `iamuser_mark` using Terraform. The username is stored in a variable `KKE_user` within variables.tf, and referenced in the main Terraform configuration to follow modular and reusable IaC best practices.

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed (version 0.12+)
- IAM permissions for user creation

## Configuration

| Parameter | Variable | Value |
|-----------|----------|-------|
| **IAM User Name** | `KKE_user` | `iamuser_mark` |

## Directory Structure

```
User Variable Setup Using Terraform/
├── main.tf
├── variables.tf
├── README.md
└── Task.png
```

## Variables

**variables.tf:**
- `KKE_user` - IAM user name variable

**main.tf:**
- Uses variable for IAM user name
- Creates IAM user resource

## Steps

1. **Run Terraform commands:**
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

2. **Verify IAM user creation:**
   ```bash
   aws iam get-user --user-name iamuser_mark
   ```

## Files

- `main.tf` - IAM user resource configuration using variables
- `variables.tf` - Variable definition for modular IaC design
- `Task.png` - Task description image

## Result

IAM User `iamuser_mark` is created using modular variable configuration following IaC best practices.