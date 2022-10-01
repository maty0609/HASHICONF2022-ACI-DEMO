variable "vsphere_datacenter" {
  description = "variable for the datacenter where the VMs will be deployed"
  type        = string
  default     = "ukdcb_production"
}

variable "vsphere_datastore" {
  description = "variable for the datastore that the VMs will be placed on"
  type        = string
  default     = "showcase-dc"
}

variable "vsphere_cluster" {
  description = "variable for the vsphere cluster that the VMs will be placed in"
  type        = string
  default     = "cluster-natilik/Resources"
}

variable "template_network" {
  description = "variable for the network name that the VMs will be created on"
  type        = string
  default     = "showcase_dc|uk-vmware-production-ap|dc-showcase-apps"
}

variable "template_name" {
  description = "variable for the template name that VMs will be cloned from"
  type        = string
  default     = "ubuntu20-consul"
}

variable "folder_path" {
  description = "variable for the folder path that will be used when deploying workloads"
  type        = string
  default     = "showcase/dc/clus2022"
}

variable "tenant_name" {
  description = "Multi-Cloud Showcase"
  type        = string
  default     = "showcase_dc"
}


variable "demo_vms" {
  type = object({
    quantity = number
    name     = string
    # cpus             = optional(number) # Removed for CLUS demo simplicity
    # memory           = optional(number) # Removed for CLUS demo simplicity
    # disk             = optional(number) # Removed for CLUS demo simplicity
    # thin             = optional(bool) # Removed for CLUS demo simplicity
    service_message  = string
    service_port     = number
    service_tag      = string
    upstream_service = string
  })
  description = "(Required) Map of the configuration that will be used for provisioning all Fake Service VMs"
}
