# Create SSM Parameter Using Terraform

## Objective

The objective of this task is to create an AWS Systems Manager (SSM) Parameter named `devops-ssm-parameter` in the us-east-1 region using Terraform. The parameter must be of type String and store the value `devops-value`, ensuring it can be retrieved programmatically after creation.

## Architecture

This Terraform configuration creates:
- An SSM Parameter for centralized configuration management
- String-type parameter for simple value storage
- Programmatically accessible configuration value
- Foundation for application configuration management

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed (version 0.12+)
- AWS provider configured for us-east-1 region
- SSM permissions for parameter creation

## Configuration Details

### SSM Parameter Specifications

| Parameter | Value | Description |
|-----------|-------|-------------|
| **Parameter Name** | `devops-ssm-parameter` | Unique SSM parameter identifier |
| **Type** | `String` | Parameter data type |
| **Value** | `devops-value` | Stored configuration value |
| **Region** | `us-east-1` | AWS region for deployment |

### Parameter Features

- **Centralized Storage** - Single source of truth for configuration
- **Programmatic Access** - Retrieve via AWS SDK/CLI
- **Version Control** - Automatic versioning of parameter changes
- **Secure** - IAM-controlled access to parameters

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

4. **Verify the parameter**
   - Check AWS Systems Manager console
   - Parameter should appear in Parameter Store

## Retrieving the Parameter

After creation, retrieve the value using:

**AWS CLI:**
```bash
aws ssm get-parameter --name "devops-ssm-parameter" --region us-east-1
```

**AWS CLI (value only):**
```bash
aws ssm get-parameter --name "devops-ssm-parameter" --query "Parameter.Value" --output text --region us-east-1
```

**Python (boto3):**
```python
import boto3
ssm = boto3.client('ssm', region_name='us-east-1')
response = ssm.get_parameter(Name='devops-ssm-parameter')
value = response['Parameter']['Value']
```

## Use Cases

Perfect for:
- Application configuration values
- Environment-specific settings
- API endpoints and URLs
- Feature flags and toggles
- Database connection strings (non-sensitive)
- Deployment configuration

## Parameter Types

- **String** - Plain text values (current configuration)
- **StringList** - Comma-separated values
- **SecureString** - Encrypted sensitive data

## Files

- `main.tf` - Contains SSM parameter resource configuration

## Best Practices

- Use descriptive parameter names
- Organize with hierarchical naming (e.g., `/app/env/config`)
- Use SecureString for sensitive data
- Implement proper IAM permissions
- Tag parameters for organization

## Cleanup

To remove the SSM parameter:
```bash
terraform destroy
```

## Next Steps

Consider adding:
- Parameter tags for organization
- Description field for documentation
- SecureString type for sensitive values
- Parameter hierarchies for complex configurations