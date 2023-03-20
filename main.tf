data "aws_organizations_organization" "org" {}

data "aws_organizations_organizational_units" "ou" {
  parent_id = data.aws_organizations_organization.org.roots[0].id
}

locals{
  org_units = {
    for index, child in data.aws_organizations_organizational_units.ou.children:
    child.name => child.id
  }
}

data "aws_organizations_organizational_unit_descendant_accounts" "ou_accounts" {
  for_each   = {
    for index, child in data.aws_organizations_organizational_units.ou.children:
    child.name => child
  }  
  parent_id = each.value.id
}

output "acuris_account_ids" {
  value =  toset(concat(
    data.aws_organizations_organizational_unit_descendant_accounts.ou_accounts["Automation"].accounts[*].id,
    data.aws_organizations_organizational_unit_descendant_accounts.ou_accounts["BI"].accounts[*].id,
    data.aws_organizations_organizational_unit_descendant_accounts.ou_accounts["Data"].accounts[*].id,
    data.aws_organizations_organizational_unit_descendant_accounts.ou_accounts["DataAnalytics"].accounts[*].id,
    data.aws_organizations_organizational_unit_descendant_accounts.ou_accounts["Growth"].accounts[*].id,
    data.aws_organizations_organizational_unit_descendant_accounts.ou_accounts["Interface"].accounts[*].id,
    data.aws_organizations_organizational_unit_descendant_accounts.ou_accounts["Platform"].accounts[*].id,
    data.aws_organizations_organizational_unit_descendant_accounts.ou_accounts["Profiles"].accounts[*].id,
    data.aws_organizations_organizational_unit_descendant_accounts.ou_accounts["Shared"].accounts[*].id,
    data.aws_organizations_organizational_unit_descendant_accounts.ou_accounts["Support"].accounts[*].id,
  ))
}

output "backstop_account_ids" {
  value = toset(concat(
    data.aws_organizations_organizational_unit_descendant_accounts.ou_accounts["Backstop Solutions"].accounts[*].id,
  ))
}

output "spaziodati_account_ids" {
  value = toset(concat(
    data.aws_organizations_organizational_unit_descendant_accounts.ou_accounts["SpazioDati"].accounts[*].id,
  ))
}

output "acuris_ou_ids" {
  value = toset([
    local.org_units["Automation"],
    local.org_units["BI"],
    local.org_units["Data"],
    local.org_units["DataAnalytics"],
    local.org_units["Growth"],
    local.org_units["Interface"],
    local.org_units["Platform"],
    local.org_units["Profiles"],
    local.org_units["Shared"],
    local.org_units["Support"],
  ])
}

output "backstop_ou_ids" {
  value = toset([
    local.org_units["Backstop Solutions"],
  ])
}

output "spaziodati_ou_ids" {
  value = toset([
    local.org_units["SpazioDati"],
  ])
}

output "ionasecurity_account_ids" {
  value = toset(concat(
    data.aws_organizations_organizational_unit_descendant_accounts.ou_accounts["IONASecurity"].accounts[*].id,
  ))
}

output "ionasecurity_ou_ids" {
  value = toset([
    local.org_units["IONASecurity"],
  ])
}

    #  + Automation         = "ou-vow6-jy4ujiac"
    #   + BI                 = "ou-vow6-zqzhhrad"
    #   + Backstop Solutions = "ou-vow6-2e9ap5r7"
    #   + Data               = "ou-vow6-67d1z9u1"
    #   + DataAnalytics      = "ou-vow6-ub639ons"
    #   + Growth             = "ou-vow6-1zv40w3t"
    #   + IONASecurity       = "ou-vow6-fmizvy28"
    #   + Interface          = "ou-vow6-8p1sfhkm"
    #   + Platform           = "ou-vow6-jhctdo01"
    #   + Profiles           = "ou-vow6-mxkpzsut"
    #   + Shared             = "ou-vow6-74i981xm"
    #   + Support            = "ou-vow6-ebj7suq6"
    #   + SpazioDati         = "ou-vow6-vn9ot4xd"