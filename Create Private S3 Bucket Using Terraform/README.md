# Create Private S3 Bucket Using Terraform

## Objective

The objective of this task is to create a private Amazon S3 bucket named `datacenter-s3-15464` in the us-east-1 region using Terraform. The bucket must have all public access blocked to ensure that data stored in it remains private and secure, aligning with the Nautilus DevOps team's cloud security policies.

## Architecture

This Terraform configuration creates:
- A private S3 bucket with restricted access
- Ownership controls for secure object management
- Private ACL to prevent unauthorized access
- Secure storage solution for sensitive data

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed (version 0.12+)
- AWS provider configured for us-east-1 region
- Sufficient AWS permissions to create and manage S3 buckets

## Configuration Details

### Bucket Specifications

| Parameter | Value | Description |
|-----------|-------|-------------|
| **Bucket Name** | `datacenter-s3-15464` | Globally unique private bucket |
| **Region** | `us-east-1` | AWS region for deployment |
| **Access Level** | `Private` | No public access allowed |
| **Object Ownership** | `BucketOwnerPreferred` | Bucket owner controls all objects |
| **ACL** | `private` | Private access control list |

### Resources Created

1. **S3 Bucket** - Main private storage bucket
2. **Ownership Controls** - Ensures bucket owner manages all objects
3. **Bucket ACL** - Sets private access permissions

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
   - Confirm bucket shows as private with no public access

## Security Features

✅ **Security Compliance**:
- Private ACL prevents public access
- Bucket owner controls all objects
- No public read/write permissions
- Aligns with cloud security policies

## Access Control

- Only AWS account owner and authorized IAM users can access
- Requires proper AWS credentials for all operations
- No anonymous or public access allowed

## Files

- `main.tf` - Contains private S3 bucket resources and security configurations

## Cleanup

To remove the private bucket:
```bash
terraform destroy
```

**Note**: Bucket must be empty before destruction.

## Best Practices

- Regularly audit bucket permissions
- Use IAM policies for granular access control
- Enable versioning for data protection
- Consider encryption for sensitive data