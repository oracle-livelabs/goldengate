/*
********************
# Copyright (c) 2021 Oracle and/or its affiliates. All rights reserved.
# by - Rene Fontcha - Oracle LiveLabs Platform Lead
# Last Updated - 06/07/2022
********************
*/

resource "oci_core_vcn" "llw" {
  count          = var.vcn_use_existing ? 0 : 1
  cidr_block     = "10.0.0.0/16"
  dns_label      = "llw"
  compartment_id = var.compartment_ocid
  display_name   = "llw-net-${local.timestamp}"
  lifecycle {
    ignore_changes = [
      display_name,
    ]
  }
}

resource "oci_core_internet_gateway" "llw-internet-gateway" {
  count          = var.vcn_use_existing ? 0 : 1
  compartment_id = var.compartment_ocid
  display_name   = "LLW Internet Gateway"
  enabled        = true
  vcn_id         = oci_core_vcn.llw[0].id
}

resource "oci_core_default_route_table" "llw-public-rt" {
  count                      = var.vcn_use_existing ? 0 : 1
  display_name               = "LLW Route Table"
  compartment_id             = var.compartment_ocid
  manage_default_resource_id = oci_core_vcn.llw[0].default_route_table_id

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.llw-internet-gateway[0].id
  }
}

resource "oci_core_default_dhcp_options" "llw-default-dhcp-options" {
  count                      = var.vcn_use_existing ? 0 : 1
  compartment_id             = var.compartment_ocid
  display_name               = "Default DHCP Options for LLW VCN"
  domain_name_type           = "CUSTOM_DOMAIN"
  manage_default_resource_id = oci_core_vcn.llw[0].default_dhcp_options_id
  options {
    custom_dns_servers = [
    ]
    server_type = "VcnLocalPlusInternet"
    type        = "DomainNameServer"
  }
  options {
    search_domain_names = [
      "livelabs.oraclevcn.com",
    ]
    type = "SearchDomain"
  }
}

resource "oci_core_network_security_group" "llw-net-security-group" {
  count          = var.vcn_use_existing ? 0 : 1
  compartment_id = var.compartment_ocid
  display_name   = "LLW Network Security Group"
  vcn_id         = oci_core_vcn.llw[0].id
}


# Duplicate the "oci_core_network_security_group_security_rule" resource block below
# and uncomment it for each additional ingress/egress rule needed and unique to the workshop, adjusting following:
# (1) - Resource name <llw-net-security-group-rule-NN> where NN is a unique id or sequence
#     e.g. "llw-net-security-group-rule-1"
# (2) - Description
#     e.g. "Enterprise Manager Console"
# (3) - direction
#     e.g. "INGRESS"
# (4) - tcp options
#     e.g.   tcp_options {
#               destination_port_range {
#                 max = "7803"
#                 min = "7803"
#                }
#              }


// allow custom traffic unique to the workshop
resource "oci_core_network_security_group_security_rule" "llw-net-security-group-rule-1" {
  count                     = var.vcn_use_existing ? 0 : 1
  description               = "Enterprise Manager Console"
  destination_type          = ""
  direction                 = "INGRESS"
  network_security_group_id = oci_core_network_security_group.llw-net-security-group[0].id
  protocol                  = "6"
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"
  stateless                 = "false"
  tcp_options {
    destination_port_range {
      max = "10400"
      min = "10000"
    }
  }
}

resource "oci_core_default_security_list" "llw-default-security-list" {
  count          = var.vcn_use_existing ? 0 : 1
  display_name   = "LLW Default Security List"
  compartment_id = var.compartment_ocid

  // allow outbound tcp traffic on all ports
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "6"
  }

  // allow inbound ssh traffic
  ingress_security_rules {
    protocol    = "6"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "22"
      min = "22"
    }
  }

  // allow inbound (tcp) traffic
  ingress_security_rules {
    protocol    = "6"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "80"
      min = "80"
    }
  }
  ingress_security_rules {
    protocol    = "6"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "443"
      min = "443"
    }
  }
  ingress_security_rules {
    protocol    = "6"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "6080"
      min = "6080"
    }
  }

  // allow inbound icmp traffic of a specific type
  ingress_security_rules {
    icmp_options {
      code = "4"
      type = "3"
    }
    protocol    = "1"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"

  }
  ingress_security_rules {
    icmp_options {
      code = "-1"
      type = "3"
    }
    protocol    = "1"
    source      = "10.0.0.0/16"
    source_type = "CIDR_BLOCK"
    stateless   = "false"

  }

  // allow unrestricted TCP traffic within the subnet
  ingress_security_rules {
    protocol = "6"
    source   = "10.0.0.0/16"
  }

  manage_default_resource_id = oci_core_vcn.llw[0].default_security_list_id
}

resource "oci_core_subnet" "public-subnet-llw" {
  count             = var.vcn_use_existing ? 0 : 1
  compartment_id    = var.compartment_ocid
  cidr_block        = "10.0.0.0/24"
  display_name      = "LLW Public Subnet"
  dns_label         = "pub"
  dhcp_options_id   = oci_core_vcn.llw[0].default_dhcp_options_id
  route_table_id    = oci_core_default_route_table.llw-public-rt[0].id
  security_list_ids = [oci_core_default_security_list.llw-default-security-list[0].id]
  vcn_id            = oci_core_vcn.llw[0].id
}
