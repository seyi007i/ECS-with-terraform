variable "public_subnets_frontend" {
  description = "Public subnet frontend"
}

variable "bastion_sg_id" {
  description = "Security group ID for the Bastion host"
  type        = string
}



variable "tf_tag" {
    type = bool
    default = true         
    description = "Terraform identifier"
  
}

variable "key" {
  description = "Compute access key"
}