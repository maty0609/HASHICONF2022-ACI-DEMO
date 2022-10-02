module "web" {
  source = "./modules/terraform-vsphere-clus2022-fakeservice-demo"
  demo_vms = {
    name             = "web"
    quantity         = 1
    service_tag      = "web"
    service_port     = 9090
    upstream_service = "http://app.service.default.ukdcb.natiliksc.com:9091"
    service_message  = "Web Server!"
  }
}

module "app" {
  source = "./modules/terraform-vsphere-clus2022-fakeservice-demo"
  demo_vms = {
    name             = "app"
    quantity         = 1
    service_tag      = "app"
    service_port     = 9091
    upstream_service = ""
    service_message  = "App Server!"
  }
}
