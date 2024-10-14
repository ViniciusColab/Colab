# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MIT

# Auth method: Domain-wide delegation and user impersonation
provider "googleworkspace" {
  credentials = "JSON CRDENTIALS"
  customer_id = "ID CONSOLE GWS"
  impersonated_user_email = "ADMIN GWS"
  oauth_scopes = [
    "https://www.googleapis.com/auth/admin.directory.user",
    "https://www.googleapis.com/auth/admin.directory.userschema",
    "https://www.googleapis.com/auth/admin.directory.group",
    "https://www.googleapis.com/auth/admin.directory.group.member",
    "https://www.googleapis.com/auth/apps.groups.migration",
    "https://www.googleapis.com/auth/apps.groups.settings"
    
    # include scopes as needed
  ]
}

locals {
  users = csvdecode(file("${var.path_module}/users.csv"))
}

resource "googleworkspace_user" "users" {
  for_each = { for user in local.users : user.email => user }

  primary_email = each.value.email
  password      = each.value.password
  hash_function = each.value.password_hash_function

  name {
    family_name = each.value.last_name
    given_name  = each.value.first_name
  }

  organizations {
    department = each.value.dept
    primary    = true
    title      = each.value.title
    type       = "work"
  }
  
  org_unit_path = each.value.org_unit_path

  recovery_email = each.value.recovery_email
}


resource "googleworkspace_group" "terra" {
  email       = "terraform@${var.domain}"
  name        = "Terraform Grupo"
  description = "Grupo criado com Terraform"

  aliases = ["terra@${var.domain}", "form@${var.domain}"]

}

resource "googleworkspace_group_member" "member" {

  for_each =  { for u in googleworkspace_user.users : u.primary_email => u if element(u.organizations[*].department, 0) == "sales" }
  group_id = googleworkspace_group.terra.id
  email    = each.value.primary_email

  role = "MEMBER"

  depends_on = [ googleworkspace_user.users ]
}

