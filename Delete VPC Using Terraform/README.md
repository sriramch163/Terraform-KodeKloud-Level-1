# Delete VPC Using Terraform

## Objective

The objective of this task is to delete the VPC named `xfusion-vpc` located in the us-east-1 region using Terraform. This task is part of the AWS migration cleanup effort to remove unused networking resources while preserving the Terraform configuration for future use.

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed and initialized
- Existing Terraform state with VPC
- VPC permissions for deletion

## Configuration

| Parameter | Value |
|-----------|-------|
| **VPC Name** | `xfusion-vpc` |
| **Region** | `us-east-1` |
| **Operation** | Targeted deletion |

## Directory Structure

```
Delete VPC Using Terraform/
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

2. **Delete specific VPC:**
   ```bash
   terraform destroy -target=aws_vpc.this
   ```

## Commands Reference

All commands are documented in `cmds.txt` for reference.

## Files

- `cmds.txt` - Command sequence for VPC deletion
- `cmd - *.png` - Step-by-step command screenshots
- `Task.png` - Task description image

## Result

VPC `xfusion-vpc` is deleted while preserving Terraform configuration files for future use.