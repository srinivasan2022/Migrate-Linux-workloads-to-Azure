variable "vm_name" {
  description = "Name of the Linux VM"
  type        = string
}
 
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}
 
variable "location" {
  description = "Azure region"
  type        = string
}
 
variable "subnet_id" {
  description = "Subnet ID for the NIC"
  type        = string
}
 
variable "vm_size" {
  description = "Size of the VM"
  type        = string
  default     = "Standard_B1s"
}
 
variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
}
 
variable "admin_ssh_key" {
  description = "SSH Public Key for authentication"
  type        = string
}
 

 
variable "image_publisher" {
  type    = string
  default = "Canonical"
}
 
variable "image_offer" {
  type    = string
  default = "UbuntuServer"
}
 
variable "image_sku" {
  type    = string
  default = "20_04-lts"
}
 
variable "image_version" {
  type    = string
  default = "latest"
}
 
