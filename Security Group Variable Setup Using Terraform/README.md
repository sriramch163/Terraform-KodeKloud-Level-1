# Security Group Variable Setup Using Terraform

## Objective

The objective of this task is to provision an AWS Security Group named `datacenter-sg` using Terraform, with the name stored in a variable `KKE_sg` inside the variables.tf file. The setup ensures proper use of variable references and modular Terraform design.

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed (version 0.12+)
- EC2 permissions for security group creation

## Configuration

| Parameter | Variable | Value |
|-----------|----------|-------|
| **Security Group Name** | `KKE_sg` | `datacenter-sg` |

## Directory Structure

```
Security Group Variable Setup Using Terraform/
├── main.tf
├── variables.tf
├── README.md
└── Task.png
```

## Variables

**variables.tf:**
- `KKE_sg` - Security group name variable

**main.tf:**
- Uses variable for security group name
- Creates security group with description

## Steps

1. **Run Terraform commands:**
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

2. **Verify security group creation:**
   ```bash
   aws ec2 describe-security-groups --group-names datacenter-sg
   ```

## Files

- `main.tf` - Security group resource configuration using variables
- `variables.tf` - Variable definition for modular design
- `Task.png` - Task description image

## Result

Security Group `datacenter-sg` is created using modular variable configuration for reusability.