## Terraform config deploys a virtual machine and a VPC infrastructure

Demo shows creating a Terraform configuration using variables and modules for reuse or extension configuration.

The configuration consists of a root module and two child modules, each containing a virtual machine and network. 

The VM can be parameterized with input variables:
```
variable "image_id" {
  description = "instance operating system"
  type        = string
  default     = "fd80qm01ah03dkqb14lc"
}
variable "instance_zone" {
  description = "instance default zone"
  type        = string
  default     = "ru-central1-a"
}
variable "instance_cores" {
  description = "instance core resources"
  type        = number
  default     = 2
}
variable "instance_memory" {
  description = "instance memory resources"
  type        = number
  default     = 2
}
variable "instance_disk_size" {
  description = "instance disk size resources"
  type        = number
  default     = 30
}
```

And network child module can iterate over the set of availability zones 'ru-central1-a', 'ru-central1-b', 'ru-central1-c', and 'ru-central1-d', and create a separate of the resource for each zone

```
for_each = toset(["ru-central1-a", "ru-central1-b", "ru-central1-c", "ru-central1-d"])
```

<details>
<summary>Before beginning</summary>

Step1. [Install](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) Terraform

Step 2. [Install and initialize](https://yandex.cloud/ru/docs/cli/quickstart#linux_1) Yandex Cloud command line interface.

Step 3. Get cloud id and folder id:  
```
yc resource-manager cloud list # Получение идентификатора облака
yc resource-manager folder list # Получение идентификатора каталога
```
Step 4. Get your [OAUTH-token](https://yandex.cloud/ru/docs/iam/concepts/authorization/oauth-token)
</details>


Step 1. Edit terraform.tfvars and set your variables

```
token           = "your cloud autorization token"
instance_zone   = "your zone"
instance_cloud  = "your cloud id"
instance_folder = "your folder id"
```
Step 2. Edit main.tf and set your SSH-key

```
ssh_key        = "ssh-rsa AAAAAAAAAAA... user@fhm12iutaehd83piugpu"
```

Step 3. Make sure in the terminal, you are in the same folder where *.tf are created. Execute below command

```
terraform init
terraform validate
terraform plan
terraform apply
```