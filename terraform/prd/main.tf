# VPC
module "network" {
  source = "../modules/network"

  APP_NAME = var.APP_NAME
  ENV      = var.ENV
  ZONE     = var.ZONE
}

# Security(ACG)
module "security" {
  depends_on = [module.network]
  source     = "../modules/security"

  VPC_ID      = module.network.main-vpc-id
  SERVER_LIST = local.CONFIG_LIST
  APP_NAME    = var.APP_NAME
  ENV         = var.ENV
  ZONE        = var.ZONE
}

# COMPUTE(Server)
module "compute" {
  depends_on = [module.security]
  source     = "../modules/compute"

  SUBNET_LIST   = module.network.list-subnets
  SERVER_LIST   = local.CONFIG_LIST
  INSTANCE_LIST = module.compute.list-servers
  ACG_LIST      = module.security.list-server-acg
  APP_NAME      = var.APP_NAME
  ENV           = var.ENV
  ZONE          = var.ZONE
}

# STORAGE(Block Storage, NAS)
module "storage" {
  depends_on = [module.compute]
  source     = "../modules/storage"

  SERVER_LIST   = local.CONFIG_LIST
  INSTANCE_LIST = module.compute.list-servers
  APP_NAME      = var.APP_NAME
  ENV           = var.ENV
  ZONE          = var.ZONE
}

# Ansible Inventory
resource "local_file" "ansible_inventory" {
  depends_on = [module.compute]

  content         = local.ansible_inventory
  filename        = "${path.root}/ansible_hosts"
  file_permission = "644"
}