terraform {
  experiments = [module_variable_optional_attrs]
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = ">=1.26.0"
    }
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">= 0.4.1"
    }
  }
}