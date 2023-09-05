output "main-vpc-id" {
  value = ncloud_vpc.main.id
}

output "list-subnets" {
  value = merge(
    {
      for private in ncloud_subnet.main-private-subnets :
      private.name => { id : private.id, type : private.subnet_type }
    },
    {
      for public in ncloud_subnet.main-public-subnets :
      public.name => { id : public.id, type : public.subnet_type }
    }
  )
}