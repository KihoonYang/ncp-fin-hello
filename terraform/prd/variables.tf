# Basic Info
variable "APP_NAME" {
  default = "hello-hro"
}

variable "ENV" {
  default = "prd"
}

variable "REGION" {
  default = "FKR"
}

variable "ZONE" {
  default = "FKR-1"
}

variable "SUPPORT_VPC" {
  default = false
}

## Instance Settings
locals {
  OS_TYPE      = "SW.VSVR.OS.LNX64.RHEL.0806.B050.H001"       //Red Hat Enterprise Linux 8.6 (64-bit)
  VM_SPEC_MIN  = "SVR.VSVR.STAND.C002.M004.NET.HDD.B050.G001" //vCPU 2EA, Memory 4GB, Disk 50GB
  VM_SPEC_STD  = "SVR.VSVR.STAND.C002.M004.NET.HDD.B050.G001" //vCPU 2EA, Memory 4GB, Disk 50GB
  VM_SPEC_HIGH = "SVR.VSVR.STAND.C002.M004.NET.HDD.B050.G001" //vCPU 2EA, Memory 4GB, Disk 50GB
}

## Block Storage Path Settings
locals {
  # mount는 ansible로 실행
  STORAGE_ROOT_VG = "/hro_app"

  STORAGE_SW_LV  = "/sw"  # S/W설치
  STORAGE_APP_LV = "/app" # Source배포
  STORAGE_LOG_LV = "/log" # Logging

  STORAGE_DATA_LV = "/data"
}


## Instance Settings (MAIN)
locals {
  CONFIG_LIST = {

    coreweb = {
      idx                 = 0
      name                = "coreweb"
      type                = "pri"
      subnet_group        = "ap"
      tier                = "frontend"
      ansible_group       = "webserver"
      storage_size        = "10"
      image_product_code  = local.OS_TYPE
      server_product_code = local.VM_SPEC_STD
      inbound = [
        ["TCP", "10.30.10.0/32", "2122", "SSH@BASTION"]
      ]
      outbound = []
      storage = {
        sw = {
          mount_point = "${local.STORAGE_ROOT_VG}+${local.STORAGE_SW_LV}"
          size        = 10
        }
        app = {
          mount_point = "${local.STORAGE_ROOT_VG}+${local.STORAGE_APP_LV}"
          size        = 20
        }
        log = {
          mount_point = "${local.STORAGE_ROOT_VG}+${local.STORAGE_LOG_LV}"
          size        = 30
        }
        data = {
          mount_point = "${local.STORAGE_ROOT_VG}+${local.STORAGE_DATA_LV}"
          size        = 40
        }
      }
    }

    # omit...

    
  }
}


# Ansible Host Settings
locals {
  ansible_inventory = templatefile(
    "${path.module}/ansible_inventory.tpl",
    {
      ansible_user_name = "swadmin"
      webserver_instances = {
        for instance_name, instance_info in module.compute.list-servers :
        instance_name => instance_info  if instance_info["tag"]["tag_value"] == "webserver"
      }

      solution_instances = {
        for instance_name, instance_info in module.compute.list-servers :
        instance_name => instance_info  if instance_info["tag"]["tag_value"] == "solution"
      }
    }
  )
}