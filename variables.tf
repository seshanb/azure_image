variable "Resource_Group_Name" {
  description = "The name of the existing resource group."
  default = "Demo_RG"
}

variable "location" {
  description = "The location/region where the new resource to be created."
  default     = "East US"
}

variable "Virtual_Network_Name" {
  description = "The name of the Virtual Network to create."
  default     = "testVirtualNetwork"
}

variable "Subnet_Name" {
  description = "The name of the Subnet under Virtual Network to create."
  default     = "Subnet1"
}


variable "Network_Interface_Name" {
  description = "The name of the Network Interface under Virtual Network to create."
  default     = "testnetworkinterface1"
}

variable "IP_Configuration_Name" {
  description = "The name for the Private internet protocol."
  default     = "testconfiguration-private-ip"
}

variable "private_IP_Address_Allocation" {
  description = "Type of ip address to be allocated to the user.Its value is static / dynamic"
  default     = "Dynamic"
}

variable "VM_Name_Prefix" {
  description = "The name of the Virtual Machine to create."
  default     = "testazure"
}

variable "image_publisher" {
  description = "The publisher of the image"
  type        = string
  default     = "canonical"
}

variable "image_offer" {
  description = "The offer of the image"
  type        = string
  default     = "ubuntu-24_04-lts"
}

variable "image_sku" {
  description = "The SKU of the image"
  type        = string
  default     = "server"
}

variable "image_version" {
  description = "The version of the image"
  type        = string
  default     = "latest"
}

