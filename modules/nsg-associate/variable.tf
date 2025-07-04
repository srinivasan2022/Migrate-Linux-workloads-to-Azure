variable "subnet_id" {
  type        = string
  description = "ID of the subnet to associate with the NSG"
  
}

variable "nsg_id" {
  type        = string
  description = "ID of the NSG to associate with the subnet"

}