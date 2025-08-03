# ECS Terraform Deployment

This project provisions a complete ECS (Elastic Container Service) infrastructure on AWS using Terraform. It includes VPC, subnets, security groups, an application load balancer (ALB), ECS cluster, and integrates with GitHub Actions for automated deployment of container images to Amazon ECR.

## Features

- **VPC**: Creates a Virtual Private Cloud with public and private subnets.
- **Subnets**: Provisions public and private subnets across multiple availability zones.
- **Security Groups**: Configures security groups for ALB, ECS, and other resources.
- **Application Load Balancer (ALB)**: Provisions an ALB for routing traffic to ECS services.
- **ECS Cluster**: Deploys an ECS cluster with a service and task definition.
- **GitHub Actions**: Automates the deployment of container images to Amazon ECR.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- AWS credentials configured (e.g., via `~/.aws/credentials` or environment variables).
- An existing key pair in AWS for SSH access to EC2 instances.
- Docker installed for building container images.

## Project Structure

```
ECS-with-terraform/
├── main.tf                # Main Terraform configuration
├── variables.tf           # Input variables for the project
├── outputs.tf             # Outputs for the project
├── modules/
│   ├── vpc/               # VPC module
│   ├── subnet/            # Subnet module
│   ├── alb/               # Application Load Balancer module
│   ├── ecs/               # ECS module
│   ├── sgs/               # Security Groups module
├── .github/
│   ├── workflows/
│       ├── deploy.yml     # GitHub Actions workflow for ECR deployment
```

## Usage

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-repo/ECS-with-terraform.git
   cd ECS-with-terraform
   ```

2. **Initialize Terraform**:
   Initialize the Terraform working directory and download the required providers and modules:
   ```bash
   terraform init
   ```

3. **Plan the Infrastructure**:
   Review the changes Terraform will make to your AWS account:
   ```bash
   terraform plan
   ```

4. **Apply the Configuration**:
   Deploy the infrastructure:
   ```bash
   terraform apply
   ```

5. **Automated Deployment with GitHub Actions**:
   - Push your Docker image to ECR using the provided GitHub Actions workflow (`.github/workflows/deploy.yml`).
   - Ensure your repository secrets are configured with `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, and `AWS_REGION`.

6. **Destroy the Infrastructure**:
   To tear down the infrastructure, run:
   ```bash
   terraform destroy
   ```

## Inputs

| Variable Name                  | Description                                      | Type         | Default Value                  |
|--------------------------------|--------------------------------------------------|--------------|--------------------------------|
| `vpc_id`                       | VPC ID where resources will be deployed         | `string`     | N/A                            |
| `public_subnets_ids`           | List of public subnet IDs for ALB               | `list(string)` | N/A                          |
| `container_port`               | Port exposed by the container                   | `number`     | `8080`                         |
| `name_prefix`                  | Prefix for naming resources                     | `string`     | `"backend"`                    |
| `desired_count`                | Number of ECS tasks to run                      | `number`     | `1`                            |

## Outputs

| Output Name                    | Description                                      |
|--------------------------------|--------------------------------------------------|
| `public_subnets_frontend`      | List of public subnet IDs for frontend           |
| `private_subnets_backend`      | List of private subnet IDs for backend           |
| `private_subnets_database`     | List of private subnet IDs for database          |
| `alb_dns_name`                 | DNS name of the Application Load Balancer        |

## Notes

- Ensure that the `vpc_cidr` and subnet CIDRs do not overlap with existing networks in your AWS account.
- Modify the `variables.tf` file to customize the configuration as per your requirements.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Author

- **Your Name** - [Your GitHub Profile](https://github.com/your-profile)
