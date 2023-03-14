# terraform-acuris-iona-org

This module returns information on the ION Analytics AWS organisation

# Usage

```hcl
module "iona_org" {
  source  = "mergermarket/iona-org/acuris"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acuris_account_ids"></a> [acuris\_account\_ids](#output\_acuris\_account\_ids) | List of account ids in the original Acuris space |
| <a name="output_acuris_ou_ids"></a> [acuris\_ou\_ids](#output\_acuris\_ou\_ids) | List of organization unit ids in the original Acuris space |
| <a name="output_backstop_account_ids"></a> [backstop\_account\_ids](#output\_backstop\_account\_ids) | List of account ids in the original Backstop space |
| <a name="output_backstop_ou_ids"></a> [backstop\_ou\_ids](#output\_backstop\_ou\_ids) | List of organization unit ids in the original Backstop space |
| <a name="output_ionasecurity_account_ids"></a> [ionasecurity\_account\_ids](#output\_ionasecurity\_account\_ids) | List of account ids in the IONA Security space |
| <a name="output_ionasecurity_ou_ids"></a> [ionasecurity\_ou\_ids](#output\_ionasecurity\_ou\_ids) | List of organization unit ids in the original IONA Security space |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
