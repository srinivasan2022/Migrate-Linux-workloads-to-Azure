

vnet_name           = "vnet-hub"
vnet_address_space  = "10.1.0.0/16"

subnets = {
  "AzureFirewallSubnet" = {
    newbits   = 11
    subnetnum = 1
  },
  "GatewaySubnet" = {
    newbits   = 8
    subnetnum = 2
  },
  "AzureBastionSubnet" = {
    newbits = 10
    subnetnum = 3
  }
}

public_ip = {
  "AzureFirewallSubnet" = {
    name                = "public-ip-fw"
    allocation_method   = "Static"
    sku                 = "Standard"
  } ,

  "GatewaySubnet" = {
    name                = "public-ip-gw"
    allocation_method   = "Static"
    sku                 = "Standard"
  } , 

  "AzureBastionSubnet" = {
    name                = "public-ip-bastion"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}



VpnGW={
  "hub-vpngw" ={
     private_ip_address_allocation       = "Dynamic"
     ip_config_name        ="onprem_ip_config"
  }
}

admin_password = "P@ssword123"  # Ensure this is secure and meets your organization's password policy