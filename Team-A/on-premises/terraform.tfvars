resource_group_name     = "rg-hub-spoke"
resource_group_location = "East US"

vnet_name           = "vnet-hub"
vnet_address_space  = "10.0.0.0/16"

subnets = {
  "subnet-web" = {
    newbits   = 8
    subnetnum = 1
  }
  "subnet-db" = {
    newbits   = 8
    subnetnum = 2
  }
  "subnet-app" = {
    newbits   = 8
    subnetnum = 3
  }
}

 