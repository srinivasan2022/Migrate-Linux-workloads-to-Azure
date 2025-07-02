resource_group_name     = "rg-hub-spoke"
resource_group_location = "East US"

vnet_name           = "vnet-hub"
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
    name                = "public-ip-hub"
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
  "workload-vm" = {
    vm_size              = "Standard_B1s"
    image_publisher      = "Canonical"
    image_offer          = "UbuntuServer"
    image_sku            = "20_04-lts"
  } ,
  "app-vm" = {
    vm_size              = "Standard_B1s"
    image_publisher      = "Canonical"
    image_offer          = "UbuntuServer"
    image_sku            = "20_04-lts"
  }
}
