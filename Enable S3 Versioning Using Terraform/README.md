# Enable S3 Versioning Using Terraform

## Objective

Enable versioning for the S3 bucket `xfusion-s3-16250` using Terraform to ensure data recovery and protection.

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed (version 0.12+)
- S3 permissions for bucket management

## Configuration

| Parameter | Value |
|-----------|-------|
| **Bucket Name** | `xfusion-s3-16250` |
| **ACL** | `private` |
| **Versioning** | `Enabled` |

## Steps

1. **Add Terraform code to main.tf** (already configured)

2. **Run Terraform commands:**
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

3. **Verify versioning status using AWS CLI:**
   ```bash
   aws s3api get-bucket-versioning --bucket xfusion-s3-16250
   ```

## Files

- `main.tf` - S3 bucket and versioning configuration

## Cleanup

```bash
terraform destroy
```