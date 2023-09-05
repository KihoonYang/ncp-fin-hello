# VPC
module "network" {
  source = "../modules/network"

  APP_NAME = var.APP_NAME
  ENV      = var.ENV
  ZONE     = var.ZONE
}