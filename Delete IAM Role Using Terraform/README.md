# Delete IAM Role Using Terraform

## Objective

The objective of this task is to delete the IAM role named `iamrole_javed` using Terraform as part of the AWS resource cleanup process. This helps in optimizing the AWS environment by removing unused IAM roles while keeping the Terraform configuration files intact for possible future provisioning.

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed and initialized
- Existing Terraform state with IAM role
- IAM permissions for role deletion

## Configuration

| Parameter | Value |
|-----------|-------|
| **IAM Role Name** | `iamrole_javed` |
| **Operation** | Targeted deletion |

## Directory Structure

```
Delete IAM Role Using Terraform/
├── cmd - 1.png
├── cmd - 2.png
├── cmd - 3.png
├── cmds.txt
├── README.md
└── Task.png
```

## Steps

1. **List current resources:**
   ```bash
   terraform state list
   ```

2. **Delete specific IAM role:**
   ```bash
   terraform destroy -target=aws_iam_role.role
   ```

## Commands Reference

All commands are documented in `cmds.txt` for reference.

## Files

- `cmds.txt` - Command sequence for IAM role deletion
- `cmd - *.png` - Step-by-step command screenshots
- `Task.png` - Task description image

## Result

IAM role `iamrole_javed` is deleted while preserving Terraform configuration files for future use.