# Create Elastic IP Using Terraform

## 🎯 Objective

Provision an Elastic IP (EIP) named nautilus-eip in the us-east-1 region using Terraform.
This EIP will be configured for use within a VPC domain, aligning with AWS best practices for network management.

## 📋 Overview

This Task demonstrates how to create an AWS Elastic IP address using Terraform Infrastructure as Code (IaC). An Elastic IP is a static IPv4 address designed for dynamic cloud computing, which can be associated with EC2 instances or network interfaces.

## 🏗️ Architecture

- **Resource**: AWS Elastic IP (EIP)
- **Region**: us-east-1 (N. Virginia)
- **Domain**: VPC (Virtual Private Cloud)
- **Name**: nautilus-eip

## 📁 Directory Structure

```
Create Elastic IP Using Terraform/
├── main.tf          # Main Terraform configuration
├── README.md        # Project documentation
└── Task.png         # Task reference image
```

## 🔧 Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed (version 0.12+)
- AWS account with permissions to create EIP resources

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

5. **View outputs**:
   ```bash
   terraform show
   ```

6. **Clean up resources**:
   ```bash
   terraform destroy
   ```

## 📊 Expected Outputs

After successful deployment, you will have:
- An Elastic IP address in us-east-1 region
- EIP tagged with name "nautilus-eip"
- EIP configured for VPC domain usage

## 💡 Key Features

- **VPC Domain**: Configured for modern VPC usage (not EC2-Classic)
- **Resource Tagging**: Proper naming convention for resource identification
- **Regional Deployment**: Targeted deployment in us-east-1 region
- **Best Practices**: Follows AWS and Terraform recommended practices

## 🔍 Verification

To verify the EIP creation:
1. Check AWS Console → EC2 → Elastic IPs
2. Look for "nautilus-eip" in the Name tag
3. Confirm the region is us-east-1
4. Verify the domain shows "vpc"