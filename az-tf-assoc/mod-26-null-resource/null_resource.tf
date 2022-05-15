resource "null_resource" "sync_app1_static" {
  depends_on = [
    time_sleep.wait_90_sec
  ]

  triggers = {
    always-update = timestamp()
  }

  connection {
    type        = "ssh"
    host        = azurerm_linux_virtual_machine.mylinuxvm.public_ip_address
    user        = azurerm_linux_virtual_machine.mylinuxvm.admin_username
    private_key = file(pathexpand("~/.ssh/azure-demo.pem"))
  }
  provisioner "file" {
    source      = "apps/app1"
    destination = "/tmp"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo cp -r /tmp/app1 /var/www/html"
    ]
  }
}
