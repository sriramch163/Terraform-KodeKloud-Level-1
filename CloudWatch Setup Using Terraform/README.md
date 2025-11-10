# CloudWatch Setup Using Terraform

## Objective

The objective of this task is to create an AWS CloudWatch log group named `xfusion-log-group` and a log stream named `xfusion-log-stream` using Terraform. This setup enables the Nautilus DevOps team to manage and monitor application logs effectively within AWS CloudWatch.

## Architecture

This Terraform configuration creates:
- A CloudWatch log group for organizing related log streams
- A log stream within the group for application log data
- Centralized logging infrastructure for monitoring and troubleshooting
- Foundation for log analysis and alerting

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed (version 0.12+)
- AWS provider configured
- CloudWatch Logs permissions for resource creation

## Configuration Details

### CloudWatch Resources Specifications

| Resource | Name | Description |
|----------|------|-------------|
| **Log Group** | `xfusion-log-group` | Container for related log streams |
| **Log Stream** | `xfusion-log-stream` | Individual log data sequence |

### Resource Hierarchy

```
xfusion-log-group (Log Group)
└── xfusion-log-stream (Log Stream)
```

### Features

- **Centralized Logging** - Single location for application logs
- **Real-time Monitoring** - Live log streaming and viewing
- **Searchable** - Query logs using CloudWatch Insights
- **Retention Control** - Configurable log retention periods
- **Integration Ready** - Works with Lambda, EC2, ECS, and more

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

4. **Verify the resources**
   - Check AWS CloudWatch console
   - Navigate to Logs → Log groups
   - Verify both log group and stream are created

## Log Management Benefits

- **Organized Structure** - Group related logs together
- **Scalable** - Handle high-volume log ingestion
- **Cost-effective** - Pay only for log storage and queries
- **Integrated** - Native AWS service integration
- **Searchable** - Advanced log search and filtering

## Sending Logs to the Stream

**AWS CLI Example:**
```bash
aws logs put-log-events \
  --log-group-name "xfusion-log-group" \
  --log-stream-name "xfusion-log-stream" \
  --log-events timestamp=$(date +%s000),message="Test log message"
```

**Application Integration:**
- Configure applications to send logs to the log group
- Use AWS SDK to programmatically write log events
- Set up log agents on EC2 instances
- Configure container logging drivers

## Use Cases

Perfect for:
- Application error logging
- System performance monitoring
- Security audit trails
- Debugging and troubleshooting
- Compliance and regulatory logging
- Real-time log analysis

## Monitoring and Alerting

Once set up, you can:
- Create CloudWatch alarms based on log patterns
- Set up metric filters for specific log events
- Use CloudWatch Insights for log analysis
- Export logs to S3 for long-term storage

## Files

- `main.tf` - Contains CloudWatch log group and stream resources

## Cleanup

To remove the CloudWatch resources:
```bash
terraform destroy
```

**Note**: All log data will be permanently deleted.

## Next Steps

Consider adding:
- Log retention policies to manage storage costs
- Metric filters for monitoring specific log patterns
- CloudWatch alarms for error detection
- Log subscription filters for real-time processing