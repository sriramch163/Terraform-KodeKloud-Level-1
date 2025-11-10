# OpenSearch Setup Using Terraform

## Objective

The objective of this task is to create an Amazon OpenSearch Service domain named `xfusion-es` using Terraform. This domain will be used by the Nautilus DevOps team to store and search application logs, enabling efficient log analysis and monitoring.

## Architecture

This Terraform configuration creates:
- An OpenSearch Service domain for log storage and analysis
- Elasticsearch 7.10 engine for search capabilities
- Foundation for centralized log management
- Scalable search and analytics platform

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed (version 0.12+)
- AWS provider configured
- OpenSearch Service permissions

## Configuration Details

### OpenSearch Domain Specifications

| Parameter | Value | Description |
|-----------|-------|-------------|
| **Domain Name** | `xfusion-es` | Unique OpenSearch domain identifier |
| **Engine Version** | `Elasticsearch_7.10` | Search engine version |
| **Instance Type** | `t3.small.search` (default) | Node instance type |
| **Instance Count** | `1` (default) | Number of data nodes |

### Default Features

- **Single-node cluster** - Cost-effective for development/testing
- **EBS storage** - Persistent data storage
- **VPC deployment** - Secure network isolation
- **Encryption** - Data encryption at rest and in transit

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

4. **Verify the domain**
   - Check AWS OpenSearch console
   - Domain should show as "Active" status
   - Note the domain endpoint for access

## Log Analysis Capabilities

Perfect for:
- **Application Log Search** - Full-text search across log data
- **Real-time Analytics** - Monitor application performance
- **Error Tracking** - Identify and analyze error patterns
- **Performance Monitoring** - Track response times and metrics
- **Security Analysis** - Detect suspicious activities
- **Compliance Reporting** - Generate audit reports

## Data Ingestion Methods

Send logs to OpenSearch using:
- **Logstash** - Data processing pipeline
- **Fluent Bit/Fluentd** - Lightweight log forwarders
- **AWS Kinesis Data Firehose** - Managed streaming service
- **CloudWatch Logs** - Direct integration
- **Application SDKs** - Direct API calls

## Access and Security

- **Domain endpoint** - HTTPS access to the cluster
- **Kibana/OpenSearch Dashboards** - Web-based visualization
- **IAM policies** - Control access permissions
- **VPC security groups** - Network-level security

## Example Log Query

Once operational, search logs using:
```json
{
  "query": {
    "match": {
      "message": "error"
    }
  },
  "sort": [
    {
      "@timestamp": {
        "order": "desc"
      }
    }
  ]
}
```

## Monitoring and Maintenance

- **CloudWatch metrics** - Monitor cluster health
- **Index management** - Automate index lifecycle
- **Snapshots** - Regular backup configuration
- **Scaling** - Adjust nodes based on load

## Files

- `main.tf` - Contains OpenSearch domain resource configuration

## Cost Considerations

- **Instance hours** - Charged per running instance
- **Storage** - EBS volume costs
- **Data transfer** - Network usage charges
- **Reserved instances** - Cost savings for long-term use

## Cleanup

To remove the OpenSearch domain:
```bash
terraform destroy
```

**Warning**: This will permanently delete all indexed data.

## Next Steps

Consider adding:
- Custom instance types and counts for production
- VPC configuration for network security
- Access policies for user permissions
- Index templates for log structure
- Automated snapshots for data backup