vnet_name           = "vnet-spoke"
vnet_address_space  = "10.2.0.0/16"

subnets = {
  "postgresql" = {
    newbits   = 8
    subnetnum = 1
  },
  "appservice" = {
    newbits   = 8
    subnetnum = 2
  },
  
}

postgres_servers = {
  "pgserver-linux" = {
    admin_username               = "pgadmin"
    admin_password               = "P@ssword123"  
    
  }
 
}

pv-name = "pg-private-endpoint"
