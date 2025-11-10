# Create DynamoDB Table Using Terraform

## Objective

The objective of this task is to create a DynamoDB table named `xfusion-users` using Terraform. The table should have a primary key named `xfusion_id` (of type String) and use the PAY_PER_REQUEST billing mode. This setup ensures cost efficiency and scalability for the Nautilus DevOps team's user data storage.

## Architecture

This Terraform configuration creates:
- A DynamoDB table optimized for variable workloads
- String-based primary key for user identification
- Pay-per-request billing for cost optimization
- Serverless NoSQL database solution

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed (version 0.12+)
- AWS provider configured
- DynamoDB permissions for table creation

## Configuration Details

### DynamoDB Table Specifications

| Parameter | Value | Description |
|-----------|-------|-------------|
| **Table Name** | `xfusion-users` | Unique DynamoDB table identifier |
| **Primary Key** | `xfusion_id` | Hash key for item identification |
| **Key Type** | `String (S)` | Primary key data type |
| **Billing Mode** | `PAY_PER_REQUEST` | On-demand pricing model |

### Key Features

- **Serverless** - No server management required
- **Auto-scaling** - Handles traffic spikes automatically
- **Cost-efficient** - Pay only for actual usage
- **High availability** - Built-in redundancy across AZs

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

4. **Verify the table**
   - Check AWS DynamoDB console
   - Table should show as "Active" status

## Billing Mode Benefits

**PAY_PER_REQUEST** advantages:
- No upfront capacity planning required
- Automatic scaling based on demand
- Cost-effective for unpredictable workloads
- No charges for idle time

## Data Operations

Once created, you can:
- Store user data with `xfusion_id` as unique identifier
- Query items using the primary key
- Perform CRUD operations via AWS SDK/CLI
- Implement secondary indexes if needed

## Example Item Structure

```json
{
  "xfusion_id": "user123",
  "name": "John Doe",
  "email": "john@example.com",
  "created_at": "2024-01-01T00:00:00Z"
}
```

## Files

- `main.tf` - Contains DynamoDB table resource configuration

## Cleanup

To remove the DynamoDB table:
```bash
terraform destroy
```

**Warning**: This will permanently delete all data in the table.

## Next Steps

Consider adding:
- Global Secondary Indexes (GSI) for additional query patterns
- Point-in-time recovery for data protection
- Encryption at rest for security
- CloudWatch alarms for monitoring