### Terraform-on-Microsoft-Azure

## Prerequisites

Create a Resource Group

Set the current Azure subscription
```shell
$ Az login 
$ az account set --subscription="<subscription_id>" 
```
# The resources will created while run the root main.tf :

  - Virtual Network
  - Subnet
  - Network Security Group
  - Public IP Address
  - Load balancer
  - Network Interface
  - Virtual Machine
  

### Run Terraform Workflow

# Create a resource Indivisual 


Run `terraform init` since this is the first time we are running Terraform from this directory.

Run `terraform plan -var-file="path of main.tfvars"` where you should see the plan of all new resources

# Example 

```shell
$ cd Modules/Vnet
$ terraform init
$ terraform plan -var-file="root/main.tfvars"
$terraform apply -var-file="root/main.tfvars" --auto-approve
$ terraform destroy -var-file="root/main.tfvars" --auto-approve
```  


