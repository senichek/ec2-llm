# EC2-LLM Deployment with Terraform

## Overview

This project sets up the cloud infrastructure required to host a Large
Language Model (LLM) behind a FastAPI service on AWS. The infrastructure
is fully provisioned using Terraform, making deployments reproducible
and consistent (not 100% completed yet).

## Current Status

✅ **Done** - Infrastructure as Code with Terraform
- Compute environment provisioning
- Security group configuration for SSH and HTTP access
- IAM role and instance profile setup
- Networking (VPC, subnets, and related resources if applicable)

⏳ **Planned** - Deploy FastAPI application on the compute environment
- Containerize the LLM service (Docker)
- Set up systemd or ECS/Fargate for process management
- Add production-ready scaling and monitoring

## Prerequisites

-   AWS account with appropriate IAM permissions
-   Terraform installed (`>=1.5.0`)
-   AWS CLI configured with credentials

## Usage

1.  Clone this repository:

    ``` bash
    git clone https://github.com/senichek/ec2-llm.git
    cd ec2-llm/terraform
    ```

2.  Initialize Terraform:

    ``` bash
    terraform init
    ```

3.  Review the plan:

    ``` bash
    terraform plan
    ```

4.  Apply the infrastructure:

    ``` bash
    terraform apply
    ```

## Next Steps

Once the infrastructure is provisioned: 
- SSH into the compute instance
- Install dependencies (FastAPI, Uvicorn, LLM libraries)
- Deploy the FastAPI server hosting the model
