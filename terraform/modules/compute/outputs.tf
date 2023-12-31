output "list-image" {
  value = {
    for image in data.ncloud_server_images.images.server_images :
    image.id => image.product_name
  }
}


output "list-product" {
  value = {
    for product in data.ncloud_server_products.products.server_products :
    product.id => product.product_name
  }
}

output "list-servers" {
  value = {
    for instance in ncloud_server.server :
    instance.name => {
      id : instance.id
    public_ip : instance.public_ip
    private_ip : instance.network_interface[0].private_ip
    network_interface_no : instance.network_interface[0].network_interface_no
    subnet_no : instance.network_interface[0].subnet_no
    platform_type : instance.platform_type
    cpu_count : instance.cpu_count
    memory_size : instance.memory_size
    tag : instance.tag_list[0]
    }
  }
}