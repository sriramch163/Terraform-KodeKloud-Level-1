# Create Snapshot Using Terraform

## 🎯 Objective

Create a snapshot of an existing AWS EBS volume named `datacenter-vol` in the us-east-1 region using Terraform. The snapshot will be named `datacenter-vol-ss` with the description "Datacenter Snapshot". This ensures that the volume's data is safely backed up and can be restored if needed, supporting the Nautilus DevOps team's efforts to automate and secure data backups across their AWS infrastructure.

## 📋 Overview

This project demonstrates the creation of an AWS EBS snapshot using Terraform Infrastructure as Code (IaC). The configuration creates a point-in-time backup of an EBS volume, providing data protection and recovery capabilities. The snapshot can be used to restore data or create new volumes with identical content.

## 🏗️ Architecture

- **Source Volume**: EBS volume named `datacenter-vol`
- **Snapshot Name**: `datacenter-vol-ss`
- **Description**: "Datacenter Snapshot"
- **Region**: us-east-1 (N. Virginia)
- **Storage**: Incremental backup stored in Amazon S3
- **Encryption**: Inherits encryption status from source volume

## 📁 Directory Structure

```
Create Snapshot Using Terraform/
├── main.tf          # Main Terraform configuration
├── README.md        # Project documentation
└── Task.png         # Task reference image
```

## 🔧 Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed (version 0.12+)
- Existing EBS volume named `datacenter-vol` in us-east-1
- AWS account with EBS snapshot creation permissions
- Sufficient snapshot storage quota

## 🚀 Usage

1. **Initialize Terraform**:
   ```bash
   terraform init
   ```

2. **Validate configuration**:
   ```bash
   terraform validate
   ```

3. **Plan the deployment**:
   ```bash
   terraform plan
   ```

4. **Apply the configuration**:
   ```bash
   terraform apply
   ```

5. **View snapshot details**:
   ```bash
   terraform show
   ```

6. **Get snapshot outputs**:
   ```bash
   terraform output
   ```

7. **Clean up resources**:
   ```bash
   terraform destroy
   ```

## 📊 Expected Outputs

After successful deployment, you will have:
- EBS snapshot named "datacenter-vol-ss" in completed state
- Snapshot ID for referencing and restoration
- Point-in-time backup of the `datacenter-vol` volume
- Snapshot description "Datacenter Snapshot"
- Incremental backup stored securely in Amazon S3

## 💡 Key Features

- **Automated Backup**: Creates snapshots without manual intervention
- **Point-in-Time Recovery**: Captures exact state of volume at creation time
- **Incremental Storage**: Only stores changed blocks to minimize costs
- **Cross-AZ Availability**: Snapshots available across all AZs in region
- **Durable Storage**: Stored redundantly in Amazon S3
- **Resource Tagging**: Proper naming for backup identification

## 🔍 Verification

To verify the snapshot creation:
1. **AWS Console**: Navigate to EC2 → Snapshots
2. **Snapshot Name**: Look for "datacenter-vol-ss" in the Name tag
3. **Snapshot State**: Confirm status shows "completed"
4. **Description**: Verify description is "Datacenter Snapshot"
5. **Source Volume**: Confirm source volume ID matches `datacenter-vol`
6. **Progress**: Ensure progress shows 100%

## 🔄 Snapshot Operations

Common snapshot operations:

**Create Volume from Snapshot**:
```hcl
resource "aws_ebs_volume" "restored_volume" {
  availability_zone = "us-east-1a"
  snapshot_id      = aws_ebs_snapshot.datacenter_vol_ss.id
  
  tags = {
    Name = "restored-datacenter-vol"
  }
}
```

**Copy Snapshot to Another Region**:
```hcl
resource "aws_ebs_snapshot_copy" "cross_region_backup" {
  source_snapshot_id = aws_ebs_snapshot.datacenter_vol_ss.id
  source_region      = "us-east-1"
  description        = "Cross-region backup of datacenter volume"
  
  tags = {
    Name = "datacenter-vol-ss-west"
  }
}
```

## 📈 Backup Strategy

**Best Practices**:
- **Regular Snapshots**: Schedule periodic backups for data protection
- **Retention Policy**: Implement lifecycle rules to manage snapshot costs
- **Cross-Region Copies**: Replicate critical snapshots for disaster recovery
- **Tagging Strategy**: Use consistent tags for backup management
- **Testing**: Regularly test snapshot restoration procedures

## ⚠️ Important Notes

- Snapshots are incremental and only store changed blocks
- First snapshot of a volume captures all data (full backup)
- Subsequent snapshots only store changes since last snapshot
- Snapshots can be created from volumes in any state (attached/detached)
- Snapshot creation may impact volume performance temporarily
- Snapshots are region-specific but can be copied across regions

## 🔐 Data Protection

**Security Features**:
- **Encryption**: Snapshots inherit encryption from source volume
- **Access Control**: IAM policies control snapshot access
- **Cross-Account Sharing**: Snapshots can be shared with other AWS accounts
- **Audit Trail**: CloudTrail logs all snapshot operations
- **Compliance**: Supports various compliance requirements

## 💰 Cost Considerations

- **Storage Cost**: ~$0.05 per GiB per month for snapshot storage
- **Incremental Billing**: Only pay for unique data blocks
- **Data Transfer**: Costs apply when copying snapshots across regions
- **Lifecycle Management**: Automated deletion reduces long-term costs
- **Compression**: AWS automatically compresses snapshot data

## 🧹 Cleanup

When snapshots are no longer needed, run `terraform destroy` to remove:
- EBS snapshot `datacenter-vol-ss`
- All associated Terraform-managed resources

**Warning**: Ensure snapshots are not needed for recovery before deletion, as this action is irreversible and will permanently remove the backup data.

## 🔄 Automation Integration

**Scheduled Backups**:
- Use AWS Lambda with CloudWatch Events for automated snapshots
- Implement backup policies with AWS Backup service
- Create custom scripts for application-consistent snapshots
- Integrate with monitoring systems for backup verification