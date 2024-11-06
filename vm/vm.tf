resource "azurerm_public_ip" "vm01" {
  name                = var.pubip_name
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Static"

  tags = {
    environment = var.env
    project = var.project
  }
}



resource "azurerm_network_interface" "vm01" {
  name                = var.nic01_name
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.ipconf1_name
    subnet_id                     = var.sub1_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm01.id
  }
}

resource "azurerm_virtual_machine" "vm01" {
  name                  = var.vm01_name
  location              = var.location
  resource_group_name   = var.rg_name
  network_interface_ids = [azurerm_network_interface.vm01.id]
  vm_size               = var.vm01_size

  delete_os_disk_on_termination = true

  delete_data_disks_on_termination = false

  storage_image_reference {
    publisher = var.vm01_publisher
    offer     = var.vm01_offer
    sku       = var.vm01_sku
    version   = "latest"
  }

  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "hostname"
    admin_username = var.vm01_username
    admin_password = var.vm01_userpswd
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }


  provisioner "file" {
    connection {
      type      = "ssh"
      user      = var.vm01_username
      password  = var.vm01_userpswd
      host      = "${azurerm_public_ip.vm01.ip_address}"
      timeout   = "2m"
    }
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
  
  provisioner "remote-exec" {
    connection {
      type      = "ssh"
      user      = var.vm01_username
      password  = var.vm01_userpswd
      host      = "${azurerm_public_ip.vm01.ip_address}"
      timeout   = "3m"
    }

    inline = [
      "sudo chmod +x /tmp/script.sh",
      "sudo sh /tmp/script.sh",
    ]
    
  }

  provisioner "local-exec" {
    command = "echo ${azurerm_public_ip.vm01.ip_address}"
  }


  tags = {
    environment = var.env
    project = var.project
  }
}