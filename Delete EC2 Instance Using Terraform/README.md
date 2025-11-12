# Delete EC2 Instance Using Terraform

## Task Objective

The objective of this task is to delete the unused EC2 instance named `nautilus-ec2` located in the us-east-1 region using Terraform, while retaining the Terraform configuration files for future use. The goal is to ensure that the instance is properly terminated and no longer consuming AWS resources, as part of the environment cleanup process.

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed and initialized
- Existing Terraform state with EC2 instance
- EC2 permissions for instance termination

## Configuration

| Parameter | Value |
|-----------|-------|
| **Instance Name** | `nautilus-ec2` |
| **Region** | `us-east-1` |
| **Operation** | Targeted deletion |

## Directory Structure

```
Delete EC2 Instance Using Terraform/
├── cmd - 1.png
├── cmd - 2.png
├── cmd - 3.png
├── cmd - 4.png
├── cmd - 5.png
├── cmds.txt
├── README.md
└── Task.png
```

## Steps

1. **List current resources:**
   ```bash
   terraform state list
   ```

2. **Check instance details:**
   ```bash
   terraform show | grep "Name"
   ```

3. **Delete specific EC2 instance:**
   ```bash
   terraform destroy -target=aws_instance.ec2
   ```

4. **Verify deletion:**
   ```bash
   terraform state list
   ```

## Commands Reference

All commands are documented in `cmds.txt` for reference.

## Files

- `cmds.txt` - Command sequence for EC2 deletion
- `cmd - *.png` - Step-by-step command screenshots
- `Task.png` - Task description image

## Result

EC2 instance `nautilus-ec2` is terminated while preserving Terraform configuration files for future use.