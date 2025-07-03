resource_group_name     = "rg-hub-spoke"
resource_group_location = "East US"

vnet_name           = "vnet-onpremises"
vnet_address_space  = "10.0.0.0/16"

subnets = {
  "workload" = {
    newbits   = 8
    subnetnum = 1
  }
  "GatewaySubnet" = {
    newbits   = 8
    subnetnum = 2
  }
}

public_ip = {
  "workload" = {
    name                = "public-ip-workload"
    allocation_method   = "Static"
    sku                 = "Standard"
  } ,

  "app" = {
    name                = "public-ip-app"
    allocation_method   = "Static"
    sku                 = "Standard"
  } , 

  "gateway" = {
    name                = "public-ip-gateway"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}

on_premises_vms = {
  "workload" = {
    vm_size              = "Standard_B1s"
    image_publisher      = "Canonical"
    image_offer          = "0001-com-ubuntu-server-focal"
    image_sku            = "20_04-lts"
    image_version   = "latest"
  } ,
  "app" = {
    vm_size              = "Standard_B1s"
    image_publisher      = "Canonical"
    image_offer          = "0001-com-ubuntu-server-focal"
    image_sku            = "20_04-lts"
    image_version   = "latest"
  }
}
admin_username = "azureuser"
admin_password = "Pass@word1234"

VpnGW={
  "on-prem-gw" ={
     private_ip_address_allocation       = "Dynamic"
     ip_config_name        ="onprem_ip_config"
  }
}