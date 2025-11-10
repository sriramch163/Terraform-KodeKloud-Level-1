# Create EBS Volume Using Terraform

## 🎯 Objective

Create an AWS Elastic Block Store (EBS) volume using Terraform as part of the Nautilus DevOps team's cloud migration process. The volume, named `nautilus-volume`, will be of type `gp3`, with a size of 2 GiB, and created in the us-east-1 region. This task aims to automate EBS volume provisioning, ensuring consistent infrastructure deployment and efficient resource management in AWS.

## 📋 Overview

This project demonstrates the creation of an AWS EBS volume using Terraform Infrastructure as Code (IaC). The configuration provisions a General Purpose SSD (gp3) volume that can be attached to EC2 instances for additional storage capacity, providing high-performance block storage for various workloads.

## 🏗️ Architecture

- **Volume Type**: gp3 (General Purpose SSD)
- **Storage Size**: 2 GiB
- **Region**: us-east-1 (N. Virginia)
- **Availability Zone**: us-east-1a
- **Performance**: Baseline 3,000 IOPS and 125 MiB/s throughput
- **Encryption**: Default (unencrypted)

## 📁 Directory Structure

```
Create EBS Volume Using Terraform/
├── main.tf          # Main Terraform configuration
├── README.md        # Project documentation
└── Task.png         # Task reference image
```

## 🔧 Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed (version 0.12+)
- AWS account with EBS volume creation permissions
- Sufficient EBS storage quota in us-east-1 region

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

5. **View volume details**:
   ```bash
   terraform show
   ```
6. **Clean up resources**:
   ```bash
   terraform destroy
   ```

## 📊 Expected Outputs

After successful deployment, you will have:
- EBS volume named "nautilus-volume" in available state
- 2 GiB gp3 volume ready for attachment
- Volume ID for referencing in other resources
- Volume located in us-east-1a availability zone
- Baseline performance of 3,000 IOPS and 125 MiB/s

## 💡 Key Features

- **High Performance**: gp3 volumes provide consistent baseline performance
- **Cost Effective**: gp3 offers better price-performance ratio than gp2
- **Scalable**: Volume can be resized without downtime when attached
- **Flexible**: Can be attached to any EC2 instance in the same AZ
- **Automated Provisioning**: Terraform manages volume lifecycle
- **Resource Tagging**: Proper naming for resource identification

## 🔍 Verification

To verify the EBS volume creation:
1. **AWS Console**: Navigate to EC2 → Volumes
2. **Volume Name**: Look for "nautilus-volume" in the Name tag
3. **Volume State**: Confirm status shows "available"
4. **Volume Type**: Verify type is "gp3"
5. **Size**: Confirm size is 2 GiB
6. **Availability Zone**: Ensure volume is in us-east-1a

## 🔗 Attaching to EC2 Instances

To attach the volume to an EC2 instance:

```hcl
resource "aws_volume_attachment" "nautilus_attachment" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.nautilus_volume.id
  instance_id = aws_instance.example.id
}
```

## 📈 Performance Characteristics

**gp3 Volume Benefits**:
- **Baseline Performance**: 3,000 IOPS and 125 MiB/s throughput
- **Burstable**: Can burst up to 16,000 IOPS for short periods
- **Consistent**: Predictable performance regardless of volume size
- **Cost Efficient**: 20% lower cost per GiB compared to gp2

## ⚠️ Important Notes

- Volume is created in us-east-1a and can only attach to instances in same AZ
- gp3 volumes provide better performance-to-cost ratio than gp2
- Volume is unencrypted by default (encryption can be added if needed)
- 2 GiB is the minimum size for EBS volumes
- Volume will incur storage charges even when not attached

## 🔧 Volume Management

Common operations after creation:
- **Attach**: Connect volume to EC2 instance for use
- **Mount**: Format and mount volume within the operating system
- **Resize**: Increase volume size as storage needs grow
- **Snapshot**: Create point-in-time backups
- **Detach**: Safely remove volume from instance

## 💰 Cost Considerations

- **Storage Cost**: ~$0.08 per GiB per month for gp3 volumes
- **IOPS Cost**: Baseline 3,000 IOPS included at no extra charge
- **Throughput Cost**: Baseline 125 MiB/s included at no extra charge
- **Snapshot Cost**: Additional charges apply for volume snapshots

## 🧹 Cleanup

When the volume is no longer needed, run `terraform destroy` to remove:
- EBS volume `nautilus-volume`
- All associated Terraform-managed resources

**Warning**: Ensure volume is detached from any instances and data is backed up before destruction, as this action is irreversible.