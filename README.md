Terraform For AWS ECS/Fargate
This terraform setup can be used to setup the AWS infrastructure for a dockerized application running on ECS with Fargate launch configuration.

Resources
This setup creates the following resources:

VPC
One public and one private subnet per AZ
Routing tables for the subnets
Internet Gateway for public subnets
NAT gateways with attached Elastic IPs for the private subnet
Two security groups
one that allows HTTP/HTTPS access
one that allows access to the specified container port
An ALB + target group with listeners for port 80 and 443
An ECR for the docker images
An ECS cluster with a service (incl. auto scaling policies for CPU and memory usage) and task definition to run docker containers from the ECR (incl. IAM execution role)
Secrets - a Terraform module that creates many secrets based on a map input value, and has a list of secret ARNs as an output value


```
aws s3api create-bucket --bucket mw-terraform-backend-store --region ap-southeast-1 --create-bucket
```
aws s3 ls --region ap-southeast-1
```


