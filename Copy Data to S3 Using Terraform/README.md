# Copy Data to S3 Using Terraform

## Objective

The objective of this task is to copy the file `/tmp/nautilus.txt` to the existing S3 bucket `nautilus-cp-6289` using Terraform. The update should be made in the existing main.tf file located in `/home/bob/terraform`. This ensures proper data migration from on-premise to AWS S3 as part of the Nautilus DevOps team's ongoing cloud transition.

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed (version 0.12+)
- S3 permissions for bucket and object operations
- Source file `/tmp/nautilus.txt` exists

## Configuration

| Parameter | Value |
|-----------|-------|
| **Source File** | `/tmp/nautilus.txt` |
| **S3 Bucket** | `nautilus-cp-6289` |
| **S3 Key** | `nautilus.txt` |
| **ACL** | `private` |
| **Working Directory** | `/home/bob/terraform` |

## Directory Structure

```
Copy Data to S3 Using Terraform/
├── main.tf
├── README.md
└── Task.png
```

## Resources

1. **aws_s3_bucket** - Creates/manages the S3 bucket
2. **aws_s3_object** - Uploads the file to S3

## Steps

1. **Navigate to working directory:**
   ```bash
   cd /home/bob/terraform
   ```

2. **Run Terraform commands:**
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

3. **Verify file upload:**
   ```bash
   aws s3 ls s3://nautilus-cp-6289/
   ```

## Files

- `main.tf` - Terraform configuration for S3 bucket and object upload
- `Task.png` - Task description image

## Result

File `/tmp/nautilus.txt` is copied to S3 bucket `nautilus-cp-6289` as `nautilus.txt` with private access.