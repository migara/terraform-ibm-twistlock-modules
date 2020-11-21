## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| kubernetes | n/a |
| null | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| console\_password | (optional) Required if enable\_bootstrap is set to true and if initial user needs to be set | `string` | n/a | yes |
| console\_username | (optional) Required if enable\_bootstrap is set to true and if initial user needs to be set | `string` | n/a | yes |
| enable\_bootstrap | (optional) setup initial user, license console and add console IP to SAN list | `bool` | `false` | no |
| image\_pull\_secrets | (optional) ImagePullSecrets is an optional list of references to secrets in the same namespace to use for pulling any of the images | `list(string)` | `[]` | no |
| namespace | Twistlock namespace | `string` | `"twistlock"` | no |
| storage\_class\_name | (Optional) Name of the storage class requested by the claim<br>Optionally set the storage class to premium storage class (ibmc-file-retain-silver) for IKS deployments | `string` | `null` | no |
| twistclok\_console\_image | Twistlock console docker image name | `string` | n/a | yes |
| twistclok\_license\_key | (optional) Required if enable\_bootstrap is set to true and if license needs to be set | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| console\_hostname | n/a |
| console\_ip | n/a |
| kubernetes\_service | n/a |

