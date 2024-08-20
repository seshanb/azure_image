   
resource "azurerm_virtual_network" "sample" {
    name                = "${var.Virtual_Network_Name}"
    address_space       = ["10.0.0.0/16"]
    location            = "${var.location}"
    resource_group_name = "${var.Resource_Group_Name}"
}

resource "azurerm_subnet" "internal" {
  name                 = "${var.Subnet_Name}"
  resource_group_name  = "${var.Resource_Group_Name}"
  virtual_network_name = "${azurerm_virtual_network.sample.name}"
  address_prefixes       = ["10.0.2.0/24"]
}


resource "azurerm_network_interface" "main" {
  name                = "${var.Network_Interface_Name}"
  location            = "${var.location}"
  resource_group_name = "${var.Resource_Group_Name}"

  ip_configuration {
    name                          = "${var.IP_Configuration_Name}"
    subnet_id                     = "${azurerm_subnet.internal.id}"
    private_ip_address_allocation = "${var.private_IP_Address_Allocation}"
  }
}

resource "azurerm_virtual_machine" "main" {
  name                  = "${var.VM_Name_Prefix}-vm"
  location              = "${var.location}"
  resource_group_name   = "${var.Resource_Group_Name}"
  network_interface_ids = ["${azurerm_network_interface.main.id}"]
  vm_size               = "Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "${var.image_publisher}"
    offer     = "${var.image_offer}"
    sku       = "${var.image_sku}"
    version   = "${var.image_version}"
  }	

  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {"key":"value"}
}