## Terraform on NCP

# Install
```bash
# add brew package
brew tap hashicorp/tap

# install tf
brew install hashicorp/tap/terraform

# check install
terraform -version
Terraform v1.5.6
on darwin_arm64
```

# Set Alias
```bash
alias tf=terraform
``` 

# Check API Authentication
> [!NOTE] settings
> - NCP 콘솔 > 마이페이지 > 계정관리 > 인증키 관리 > API 인증키 관리
> - terraform > dev > provider.tf > access_key / secret_key
```bash
Access Key ID : C2AF5118B2**********
Secret Key : 7E92A25543BDE8696F4E2FA7D093BF**********
```

# Example Useage
```bash
# initialize
ncp-fin-hello/terraform/dev> tf init

Initializing the backend...
Initializing modules...

Initializing provider plugins...
- Finding latest version of navercloudplatform/ncloud...
- Installing navercloudplatform/ncloud v2.3.18...
- Installed navercloudplatform/ncloud v2.3.18 (self-signed, key ID C87A7F3A647411EB)

Partner and community providers are signed by their developers.
If you'd like to know more about provider signing, you can read about it here:
https://www.terraform.io/docs/cli/plugins/signing.html

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

```bash
# plan
ncp-fin-hello/terraform/dev> tf plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.network.ncloud_nat_gateway.main-nat-gateway will be created
  + resource "ncloud_nat_gateway" "main-nat-gateway" {
      + id             = (known after apply)
      + name           = "nat-hello-hro-dev"
      + nat_gateway_no = (known after apply)
      + private_ip     = (known after apply)
      + public_ip      = (known after apply)
      + public_ip_no   = (known after apply)
      + subnet_name    = (known after apply)
      + subnet_no      = (known after apply)
      + vpc_no         = (known after apply)
      + zone           = "FKR-1"
    }

  # module.network.ncloud_subnet.main-private-lb-subnets["pri"] will be created
  + resource "ncloud_subnet" "main-private-lb-subnets" {
      + id             = (known after apply)
      + name           = "sn-hello-hro-dev-lb-pri"
      + network_acl_no = (known after apply)
      + subnet         = "10.3.210.0/24"
      + subnet_no      = (known after apply)
      + subnet_type    = "PRIVATE"
      + usage_type     = "LOADB"
      + vpc_no         = (known after apply)
      + zone           = "FKR-1"
    }

  # module.network.ncloud_subnet.main-private-lb-subnets["pub"] will be created
  + resource "ncloud_subnet" "main-private-lb-subnets" {
      + id             = (known after apply)
      + name           = "sn-hello-hro-dev-lb-pub"
      + network_acl_no = (known after apply)
      + subnet         = "10.3.200.0/24"
      + subnet_no      = (known after apply)
      + subnet_type    = "PRIVATE"
      + usage_type     = "LOADB"
      + vpc_no         = (known after apply)
      + zone           = "FKR-1"
    }

  # module.network.ncloud_subnet.main-private-subnets["ap"] will be created
  + resource "ncloud_subnet" "main-private-subnets" {
      + id             = (known after apply)
      + name           = "sn-hello-hro-dev-ap-pri"
      + network_acl_no = (known after apply)
      + subnet         = "10.3.20.0/24"
      + subnet_no      = (known after apply)
      + subnet_type    = "PRIVATE"
      + usage_type     = "GEN"
      + vpc_no         = (known after apply)
      + zone           = "FKR-1"
    }

  # module.network.ncloud_subnet.main-private-subnets["db"] will be created
  + resource "ncloud_subnet" "main-private-subnets" {
      + id             = (known after apply)
      + name           = "sn-hello-hro-dev-db-pri"
      + network_acl_no = (known after apply)
      + subnet         = "10.3.30.0/24"
      + subnet_no      = (known after apply)
      + subnet_type    = "PRIVATE"
      + usage_type     = "GEN"
      + vpc_no         = (known after apply)
      + zone           = "FKR-1"
    }

  # module.network.ncloud_subnet.main-private-subnets["fep"] will be created
  + resource "ncloud_subnet" "main-private-subnets" {
      + id             = (known after apply)
      + name           = "sn-hello-hro-dev-fep-pri"
      + network_acl_no = (known after apply)
      + subnet         = "10.3.40.0/24"
      + subnet_no      = (known after apply)
      + subnet_type    = "PRIVATE"
      + usage_type     = "GEN"
      + vpc_no         = (known after apply)
      + zone           = "FKR-1"
    }

  # module.network.ncloud_subnet.main-private-subnets["mgt"] will be created
  + resource "ncloud_subnet" "main-private-subnets" {
      + id             = (known after apply)
      + name           = "sn-hello-hro-dev-mgt-pri"
      + network_acl_no = (known after apply)
      + subnet         = "10.3.51.0/24"
      + subnet_no      = (known after apply)
      + subnet_type    = "PRIVATE"
      + usage_type     = "GEN"
      + vpc_no         = (known after apply)
      + zone           = "FKR-1"
    }

  # module.network.ncloud_subnet.main-public-subnets["mgt"] will be created
  + resource "ncloud_subnet" "main-public-subnets" {
      + id             = (known after apply)
      + name           = "sn-hello-hro-dev-mgt-pub"
      + network_acl_no = (known after apply)
      + subnet         = "10.3.50.0/24"
      + subnet_no      = (known after apply)
      + subnet_type    = "PUBLIC"
      + usage_type     = "GEN"
      + vpc_no         = (known after apply)
      + zone           = "FKR-1"
    }

  # module.network.ncloud_subnet.main-public-subnets["web"] will be created
  + resource "ncloud_subnet" "main-public-subnets" {
      + id             = (known after apply)
      + name           = "sn-hello-hro-dev-web-pub"
      + network_acl_no = (known after apply)
      + subnet         = "10.3.10.0/24"
      + subnet_no      = (known after apply)
      + subnet_type    = "PUBLIC"
      + usage_type     = "GEN"
      + vpc_no         = (known after apply)
      + zone           = "FKR-1"
    }

  # module.network.ncloud_vpc.main will be created
  + resource "ncloud_vpc" "main" {
      + default_access_control_group_no = (known after apply)
      + default_network_acl_no          = (known after apply)
      + default_private_route_table_no  = (known after apply)
      + default_public_route_table_no   = (known after apply)
      + id                              = (known after apply)
      + ipv4_cidr_block                 = "10.3.0.0/16"
      + name                            = "vpc-hello-hro-dev"
      + vpc_no                          = (known after apply)
    }

Plan: 10 to add, 0 to change, 0 to destroy.
```


```bash
# apply
 ncp-fin-hello/terraform/dev> tf apply  

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.network.ncloud_subnet.main-private-lb-subnets["pri"] will be created
  + resource "ncloud_subnet" "main-private-lb-subnets" {
      + id             = (known after apply)
      + name           = "sn-hello-hro-dev-lb-pri"
      + network_acl_no = (known after apply)
      + subnet         = "10.3.210.0/24"
      + subnet_no      = (known after apply)
      + subnet_type    = "PRIVATE"
      + usage_type     = "LOADB"
      + vpc_no         = (known after apply)
      + zone           = "FKR-1"
    }

  # module.network.ncloud_subnet.main-private-lb-subnets["pub"] will be created
  + resource "ncloud_subnet" "main-private-lb-subnets" {
      + id             = (known after apply)
      + name           = "sn-hello-hro-dev-lb-pub"
      + network_acl_no = (known after apply)
      + subnet         = "10.3.200.0/24"
      + subnet_no      = (known after apply)
      + subnet_type    = "PRIVATE"
      + usage_type     = "LOADB"
      + vpc_no         = (known after apply)
      + zone           = "FKR-1"
    }

  # module.network.ncloud_subnet.main-private-subnets["ap"] will be created
  + resource "ncloud_subnet" "main-private-subnets" {
      + id             = (known after apply)
      + name           = "sn-hello-hro-dev-ap-pri"
      + network_acl_no = (known after apply)
      + subnet         = "10.3.20.0/24"
      + subnet_no      = (known after apply)
      + subnet_type    = "PRIVATE"
      + usage_type     = "GEN"
      + vpc_no         = (known after apply)
      + zone           = "FKR-1"
    }

  # module.network.ncloud_subnet.main-private-subnets["db"] will be created
  + resource "ncloud_subnet" "main-private-subnets" {
      + id             = (known after apply)
      + name           = "sn-hello-hro-dev-db-pri"
      + network_acl_no = (known after apply)
      + subnet         = "10.3.30.0/24"
      + subnet_no      = (known after apply)
      + subnet_type    = "PRIVATE"
      + usage_type     = "GEN"
      + vpc_no         = (known after apply)
      + zone           = "FKR-1"
    }

  # module.network.ncloud_subnet.main-private-subnets["fep"] will be created
  + resource "ncloud_subnet" "main-private-subnets" {
      + id             = (known after apply)
      + name           = "sn-hello-hro-dev-fep-pri"
      + network_acl_no = (known after apply)
      + subnet         = "10.3.40.0/24"
      + subnet_no      = (known after apply)
      + subnet_type    = "PRIVATE"
      + usage_type     = "GEN"
      + vpc_no         = (known after apply)
      + zone           = "FKR-1"
    }

  # module.network.ncloud_subnet.main-private-subnets["mgt"] will be created
  + resource "ncloud_subnet" "main-private-subnets" {
      + id             = (known after apply)
      + name           = "sn-hello-hro-dev-mgt-pri"
      + network_acl_no = (known after apply)
      + subnet         = "10.3.51.0/24"
      + subnet_no      = (known after apply)
      + subnet_type    = "PRIVATE"
      + usage_type     = "GEN"
      + vpc_no         = (known after apply)
      + zone           = "FKR-1"
    }

  # module.network.ncloud_subnet.main-public-subnets["mgt"] will be created
  + resource "ncloud_subnet" "main-public-subnets" {
      + id             = (known after apply)
      + name           = "sn-hello-hro-dev-mgt-pub"
      + network_acl_no = (known after apply)
      + subnet         = "10.3.50.0/24"
      + subnet_no      = (known after apply)
      + subnet_type    = "PUBLIC"
      + usage_type     = "GEN"
      + vpc_no         = (known after apply)
      + zone           = "FKR-1"
    }

  # module.network.ncloud_subnet.main-public-subnets["web"] will be created
  + resource "ncloud_subnet" "main-public-subnets" {
      + id             = (known after apply)
      + name           = "sn-hello-hro-dev-web-pub"
      + network_acl_no = (known after apply)
      + subnet         = "10.3.10.0/24"
      + subnet_no      = (known after apply)
      + subnet_type    = "PUBLIC"
      + usage_type     = "GEN"
      + vpc_no         = (known after apply)
      + zone           = "FKR-1"
    }

  # module.network.ncloud_vpc.main will be created
  + resource "ncloud_vpc" "main" {
      + default_access_control_group_no = (known after apply)
      + default_network_acl_no          = (known after apply)
      + default_private_route_table_no  = (known after apply)
      + default_public_route_table_no   = (known after apply)
      + id                              = (known after apply)
      + ipv4_cidr_block                 = "10.3.0.0/16"
      + name                            = "vpc-hello-hro-dev"
      + vpc_no                          = (known after apply)
    }

Plan: 9 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.network.ncloud_vpc.main: Creating...
module.network.ncloud_vpc.main: Creation complete after 6s [id=21415]
module.network.ncloud_subnet.main-private-subnets["fep"]: Creating...
module.network.ncloud_subnet.main-private-subnets["ap"]: Creating...
module.network.ncloud_subnet.main-public-subnets["web"]: Creating...
module.network.ncloud_subnet.main-private-subnets["db"]: Creating...
module.network.ncloud_subnet.main-private-lb-subnets["pub"]: Creating...
module.network.ncloud_subnet.main-private-subnets["mgt"]: Creating...
module.network.ncloud_subnet.main-public-subnets["mgt"]: Creating...
module.network.ncloud_subnet.main-private-lb-subnets["pri"]: Creating...
module.network.ncloud_subnet.main-private-lb-subnets["pub"]: Still creating... [10s elapsed]
module.network.ncloud_subnet.main-public-subnets["mgt"]: Still creating... [10s elapsed]
module.network.ncloud_subnet.main-private-subnets["fep"]: Still creating... [10s elapsed]
module.network.ncloud_subnet.main-private-subnets["mgt"]: Still creating... [10s elapsed]
module.network.ncloud_subnet.main-public-subnets["web"]: Still creating... [10s elapsed]
module.network.ncloud_subnet.main-private-subnets["ap"]: Still creating... [10s elapsed]
module.network.ncloud_subnet.main-private-subnets["db"]: Still creating... [10s elapsed]
module.network.ncloud_subnet.main-private-lb-subnets["pri"]: Still creating... [10s elapsed]
module.network.ncloud_subnet.main-private-subnets["ap"]: Creation complete after 12s [id=33670]
module.network.ncloud_subnet.main-public-subnets["web"]: Creation complete after 12s [id=33671]
module.network.ncloud_subnet.main-public-subnets["mgt"]: Creation complete after 12s [id=33672]
module.network.ncloud_subnet.main-private-subnets["fep"]: Creation complete after 12s [id=33673]
module.network.ncloud_subnet.main-private-lb-subnets["pri"]: Creation complete after 12s [id=33674]
module.network.ncloud_subnet.main-private-subnets["mgt"]: Creation complete after 12s [id=33675]
module.network.ncloud_subnet.main-private-lb-subnets["pub"]: Creation complete after 12s [id=33676]
module.network.ncloud_subnet.main-private-subnets["db"]: Creation complete after 12s [id=33677]

Apply complete! Resources: 9 added, 0 changed, 0 destroyed.
```


```bash
# destory
 ncp-fin-hello/terraform/dev> tf destory
 module.network.ncloud_vpc.main: Refreshing state... [id=21415]
module.network.ncloud_subnet.main-public-subnets["web"]: Refreshing state... [id=33671]
module.network.ncloud_subnet.main-public-subnets["mgt"]: Refreshing state... [id=33672]
module.network.ncloud_subnet.main-private-lb-subnets["pub"]: Refreshing state... [id=33676]
module.network.ncloud_subnet.main-private-lb-subnets["pri"]: Refreshing state... [id=33674]
module.network.ncloud_subnet.main-private-subnets["db"]: Refreshing state... [id=33677]
module.network.ncloud_subnet.main-private-subnets["mgt"]: Refreshing state... [id=33675]
module.network.ncloud_subnet.main-private-subnets["ap"]: Refreshing state... [id=33670]
module.network.ncloud_subnet.main-private-subnets["fep"]: Refreshing state... [id=33673]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # module.network.ncloud_subnet.main-private-lb-subnets["pri"] will be destroyed
  - resource "ncloud_subnet" "main-private-lb-subnets" {
      - id             = "33674" -> null
      - name           = "sn-hello-hro-dev-lb-pri" -> null
      - network_acl_no = "27177" -> null
      - subnet         = "10.3.210.0/24" -> null
      - subnet_no      = "33674" -> null
      - subnet_type    = "PRIVATE" -> null
      - usage_type     = "LOADB" -> null
      - vpc_no         = "21415" -> null
      - zone           = "FKR-1" -> null
    }

  # module.network.ncloud_subnet.main-private-lb-subnets["pub"] will be destroyed
  - resource "ncloud_subnet" "main-private-lb-subnets" {
      - id             = "33676" -> null
      - name           = "sn-hello-hro-dev-lb-pub" -> null
      - network_acl_no = "27177" -> null
      - subnet         = "10.3.200.0/24" -> null
      - subnet_no      = "33676" -> null
      - subnet_type    = "PRIVATE" -> null
      - usage_type     = "LOADB" -> null
      - vpc_no         = "21415" -> null
      - zone           = "FKR-1" -> null
    }

  # module.network.ncloud_subnet.main-private-subnets["ap"] will be destroyed
  - resource "ncloud_subnet" "main-private-subnets" {
      - id             = "33670" -> null
      - name           = "sn-hello-hro-dev-ap-pri" -> null
      - network_acl_no = "27177" -> null
      - subnet         = "10.3.20.0/24" -> null
      - subnet_no      = "33670" -> null
      - subnet_type    = "PRIVATE" -> null
      - usage_type     = "GEN" -> null
      - vpc_no         = "21415" -> null
      - zone           = "FKR-1" -> null
    }

  # module.network.ncloud_subnet.main-private-subnets["db"] will be destroyed
  - resource "ncloud_subnet" "main-private-subnets" {
      - id             = "33677" -> null
      - name           = "sn-hello-hro-dev-db-pri" -> null
      - network_acl_no = "27177" -> null
      - subnet         = "10.3.30.0/24" -> null
      - subnet_no      = "33677" -> null
      - subnet_type    = "PRIVATE" -> null
      - usage_type     = "GEN" -> null
      - vpc_no         = "21415" -> null
      - zone           = "FKR-1" -> null
    }

  # module.network.ncloud_subnet.main-private-subnets["fep"] will be destroyed
  - resource "ncloud_subnet" "main-private-subnets" {
      - id             = "33673" -> null
      - name           = "sn-hello-hro-dev-fep-pri" -> null
      - network_acl_no = "27177" -> null
      - subnet         = "10.3.40.0/24" -> null
      - subnet_no      = "33673" -> null
      - subnet_type    = "PRIVATE" -> null
      - usage_type     = "GEN" -> null
      - vpc_no         = "21415" -> null
      - zone           = "FKR-1" -> null
    }

  # module.network.ncloud_subnet.main-private-subnets["mgt"] will be destroyed
  - resource "ncloud_subnet" "main-private-subnets" {
      - id             = "33675" -> null
      - name           = "sn-hello-hro-dev-mgt-pri" -> null
      - network_acl_no = "27177" -> null
      - subnet         = "10.3.51.0/24" -> null
      - subnet_no      = "33675" -> null
      - subnet_type    = "PRIVATE" -> null
      - usage_type     = "GEN" -> null
      - vpc_no         = "21415" -> null
      - zone           = "FKR-1" -> null
    }

  # module.network.ncloud_subnet.main-public-subnets["mgt"] will be destroyed
  - resource "ncloud_subnet" "main-public-subnets" {
      - id             = "33672" -> null
      - name           = "sn-hello-hro-dev-mgt-pub" -> null
      - network_acl_no = "27177" -> null
      - subnet         = "10.3.50.0/24" -> null
      - subnet_no      = "33672" -> null
      - subnet_type    = "PUBLIC" -> null
      - usage_type     = "GEN" -> null
      - vpc_no         = "21415" -> null
      - zone           = "FKR-1" -> null
    }

  # module.network.ncloud_subnet.main-public-subnets["web"] will be destroyed
  - resource "ncloud_subnet" "main-public-subnets" {
      - id             = "33671" -> null
      - name           = "sn-hello-hro-dev-web-pub" -> null
      - network_acl_no = "27177" -> null
      - subnet         = "10.3.10.0/24" -> null
      - subnet_no      = "33671" -> null
      - subnet_type    = "PUBLIC" -> null
      - usage_type     = "GEN" -> null
      - vpc_no         = "21415" -> null
      - zone           = "FKR-1" -> null
    }

  # module.network.ncloud_vpc.main will be destroyed
  - resource "ncloud_vpc" "main" {
      - default_access_control_group_no = "41730" -> null
      - default_network_acl_no          = "27177" -> null
      - default_private_route_table_no  = "34554" -> null
      - default_public_route_table_no   = "34553" -> null
      - id                              = "21415" -> null
      - ipv4_cidr_block                 = "10.3.0.0/16" -> null
      - name                            = "vpc-hello-hro-dev" -> null
      - vpc_no                          = "21415" -> null
    }

Plan: 0 to add, 0 to change, 9 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

module.network.ncloud_subnet.main-public-subnets["web"]: Destroying... [id=33671]
module.network.ncloud_subnet.main-private-lb-subnets["pub"]: Destroying... [id=33676]
module.network.ncloud_subnet.main-private-lb-subnets["pri"]: Destroying... [id=33674]
module.network.ncloud_subnet.main-private-subnets["db"]: Destroying... [id=33677]
module.network.ncloud_subnet.main-private-subnets["fep"]: Destroying... [id=33673]
module.network.ncloud_subnet.main-public-subnets["mgt"]: Destroying... [id=33672]
module.network.ncloud_subnet.main-private-subnets["ap"]: Destroying... [id=33670]
module.network.ncloud_subnet.main-private-subnets["mgt"]: Destroying... [id=33675]
module.network.ncloud_subnet.main-public-subnets["mgt"]: Still destroying... [id=33672, 10s elapsed]
module.network.ncloud_subnet.main-private-subnets["ap"]: Still destroying... [id=33670, 10s elapsed]
module.network.ncloud_subnet.main-public-subnets["web"]: Still destroying... [id=33671, 10s elapsed]
module.network.ncloud_subnet.main-private-subnets["db"]: Still destroying... [id=33677, 10s elapsed]
module.network.ncloud_subnet.main-private-lb-subnets["pri"]: Still destroying... [id=33674, 10s elapsed]
module.network.ncloud_subnet.main-private-subnets["mgt"]: Still destroying... [id=33675, 10s elapsed]
module.network.ncloud_subnet.main-private-subnets["fep"]: Still destroying... [id=33673, 10s elapsed]
module.network.ncloud_subnet.main-private-lb-subnets["pub"]: Still destroying... [id=33676, 10s elapsed]
module.network.ncloud_subnet.main-private-lb-subnets["pub"]: Destruction complete after 12s
module.network.ncloud_subnet.main-private-lb-subnets["pri"]: Destruction complete after 12s
module.network.ncloud_subnet.main-private-subnets["ap"]: Destruction complete after 12s
module.network.ncloud_subnet.main-private-subnets["db"]: Destruction complete after 12s
module.network.ncloud_subnet.main-private-subnets["mgt"]: Destruction complete after 13s
module.network.ncloud_subnet.main-private-subnets["fep"]: Destruction complete after 13s
module.network.ncloud_subnet.main-public-subnets["web"]: Destruction complete after 13s
module.network.ncloud_subnet.main-public-subnets["mgt"]: Destruction complete after 13s
module.network.ncloud_vpc.main: Destroying... [id=21415]
module.network.ncloud_vpc.main: Still destroying... [id=21415, 10s elapsed]
module.network.ncloud_vpc.main: Destruction complete after 12s

Destroy complete! Resources: 9 destroyed.
 ```
