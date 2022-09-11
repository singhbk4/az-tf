resource "azurerm_resource_group" "local_rm" {
    name = "RG-01"
    location = "East US"
}

resource "azurerm_virtual_network" "local_vnet01" {
    name = "VNET-01"
    resource_group_name = azurerm_resource_group.local_rm.name
    location = azurerm_resource_group.local_rm.location
    address_space = [ "10.1.0.0/16" ]
    tags = {
        name = "Prod-vnet01"
    }
}

resource "azurerm_subnet" "vnet01_subnet" {
    name = "Subnet-A"
    resource_group_name = azurerm_resource_group.local_rm.name
    virtual_network_name = azurerm_virtual_network.local_vnet01.name
    address_prefixes = [ "10.0.1.0/24" ]
}

resource "azurerm_network_interface" "vnic" {
    name = ""
    resource_group_name = azurerm_resource_group.local_rm.name
    location = azurerm_resource_group.local_rm.name
    ip_configuration {
      name = ""
      subnet_id = azurerm_subnet.vnet01_subnet.id
      private_ip_address_allocation = ""
    }
  
}