# Create IAM Group Using Terraform

## Objective

The objective of this task is to create an IAM group named `iamgroup_siva` using Terraform. IAM groups allow the DevOps team to efficiently manage permissions for multiple users by assigning policies at the group level, streamlining AWS access management.

## Architecture

This Terraform configuration creates:
- A basic IAM group for user management
- Foundation for centralized permission management
- Scalable access control structure

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed (version 0.12+)
- AWS provider configured
- IAM permissions to create groups

## Configuration Details

### IAM Group Specifications

| Parameter | Value | Description |
|-----------|-------|-------------|
| **Group Name** | `iamgroup_siva` | Unique IAM group identifier |
| **Resource Name** | `iam_group` | Terraform resource reference |

### Resources Created

1. **IAM Group** - Basic group container for users and policies

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

4. **Verify the group**
   - Check AWS IAM console
   - Group should appear in Groups list

## Benefits of IAM Groups

- **Centralized Management** - Apply policies to multiple users at once
- **Simplified Administration** - Add/remove users from groups instead of individual policy management
- **Consistent Permissions** - Ensure all group members have same access level
- **Scalability** - Easy to manage permissions as team grows

## Post-Creation Steps

After creating the group, you can:
- Attach IAM policies for specific permissions
- Add IAM users to the group
- Create additional groups for different roles
- Implement role-based access control

## Files

- `main.tf` - Contains IAM group resource configuration

## Cleanup

To remove the IAM group:
```bash
terraform destroy
```

**Note**: Remove all users from group and detach policies before deletion.

## Next Steps

Consider adding:
- IAM policies for group permissions
- User memberships to populate the group
- Additional groups for different access levels