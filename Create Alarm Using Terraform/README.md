# Create CloudWatch Alarm Using Terraform

## Objective

The objective of this task is to create a CloudWatch alarm named `xfusion-alarm` using Terraform to monitor the CPU utilization of an EC2 instance. The alarm should trigger when CPU utilization exceeds 80%, with a single evaluation period of 5 minutes. This helps the Nautilus DevOps team proactively monitor system performance and take early action if high CPU usage occurs.

## Architecture

This Terraform configuration creates a CloudWatch metric alarm that:
- Monitors EC2 CPU utilization across all instances in the region
- Triggers when average CPU usage ≥ 80% over a 5-minute period
- Provides early warning for performance issues

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed (version 0.12+)
- AWS provider configured in your Terraform configuration

## Configuration Details

### Alarm Specifications

| Parameter | Value | Description |
|-----------|-------|-------------|
| **Alarm Name** | `xfusion-alarm` | Unique identifier for the alarm |
| **Metric** | `CPUUtilization` | AWS/EC2 namespace metric |
| **Threshold** | `80%` | CPU utilization trigger point |
| **Comparison** | `GreaterThanOrEqualToThreshold` | Alarm when CPU ≥ 80% |
| **Evaluation Period** | `1` | Single evaluation period |
| **Period** | `300 seconds` | 5-minute monitoring window |
| **Statistic** | `Average` | Average CPU over the period |

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

4. **Verify the alarm**
   - Check AWS CloudWatch console
   - Alarm should appear in "INSUFFICIENT_DATA" state initially

## Files

- `main.tf` - Contains the CloudWatch alarm resource configuration

## Monitoring Scope

This alarm monitors CPU utilization for **all EC2 instances** in the current AWS region. To monitor a specific instance, add the `dimensions` parameter:

```hcl
dimensions = {
  InstanceId = "i-1234567890abcdef0"
}
```

## Cleanup

To remove the alarm:
```bash
terraform destroy
```

## Notes

- The alarm will be in "INSUFFICIENT_DATA" state until EC2 instances generate CPU metrics
- No notification actions are configured - add SNS topics to `alarm_actions` for notifications
- Alarm evaluates every 5 minutes based on the configured period