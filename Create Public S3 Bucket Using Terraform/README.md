# Create Public S3 Bucket Using Terraform

## Objective

The objective of this task is to create a public S3 bucket named `xfusion-s3-15497` using Terraform. The bucket is configured with public read access, allowing public users to read objects stored in the bucket. This setup is useful for hosting static websites, public assets, or shared resources that need to be accessible without authentication.

## Architecture

This Terraform configuration creates:
- An S3 bucket with a unique name
- Public access configuration allowing read access
- Proper ownership controls for public access
- ACL settings for public-read permissions

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed (version 0.12+)
- AWS provider configured in your Terraform configuration
- Sufficient AWS permissions to create and manage S3 buckets

## Configuration Details

### Bucket Specifications

| Parameter | Value | Description |
|-----------|-------|-------------|
| **Bucket Name** | `xfusion-s3-15497` | Globally unique bucket identifier |
| **Access Level** | `Public Read` | Objects can be read by anyone |
| **Object Ownership** | `BucketOwnerPreferred` | Bucket owner controls objects |
| **Public Access** | `Enabled` | All public access blocks disabled |

### Resources Created

1. **S3 Bucket** - Main storage bucket
2. **Ownership Controls** - Manages object ownership
3. **Public Access Block** - Disables public access restrictions
4. **Bucket ACL** - Sets public-read permissions

## Usage

1. **Initialize Terraform**
   ```bash
   terraform init
   ```

2. **Plan the deployment**
   ```bash
   terraform plan
   ```

3. **Apply the configuration**
   ```bash
   terraform apply
   ```

4. **Verify the bucket**
   - Check AWS S3 console
   - Bucket should be listed with public access enabled

## Security Considerations

⚠️ **Warning**: This bucket is configured for public read access. Ensure you:
- Only store non-sensitive data
- Regularly audit bucket contents
- Monitor access logs
- Consider bucket policies for additional security

## Access URL

Once created, objects can be accessed via:
```
https://xfusion-s3-15497.s3.amazonaws.com/object-name
```

## Files

- `main.tf` - Contains all S3 bucket resources and configurations

## Cleanup

To remove the bucket and all configurations:
```bash
terraform destroy
```

**Note**: Bucket must be empty before destruction.