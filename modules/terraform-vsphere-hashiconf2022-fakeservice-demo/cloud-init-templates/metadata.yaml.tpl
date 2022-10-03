#cloud-config
local-hostname: ${name}
instance-id: ${name}
wait-on-network:
  ipv4: false
  ipv6: false
growpart:
  mode: auto
  devices: ['/dev/sda2']
  ignore_growroot_disabled: true
network:
  version: 2
  ethernets:
    ens192:
      dhcp4: true
      dhcp-identifier: mac
      nameservers:
          addresses: [127.0.0.1]
