## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| helm | n/a |
| null | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| chart\_name | Helm chart name | `string` | n/a | yes |
| console\_hostname | The console address for defender communication | `string` | n/a | yes |
| console\_password | Console password | `string` | n/a | yes |
| console\_username | Console username | `string` | n/a | yes |
| helm\_release\_name | Helm release name | `string` | n/a | yes |
| k8s\_client\_certificate | PEM-encoded client certificate for TLS authentication. Can be sourced from KUBE\_CLIENT\_CERT\_DATA. | `string` | n/a | yes |
| k8s\_client\_key | PEM-encoded client certificate key for TLS authentication. Can be sourced from KUBE\_CLIENT\_KEY\_DATA. | `string` | n/a | yes |
| k8s\_cluster\_ca\_certificate | PEM-encoded root certificates bundle for TLS authentication. Can be sourced from KUBE\_CLUSTER\_CA\_CERT\_DATA. | `string` | n/a | yes |
| kubernetes\_host | The hostname (in form of URI) of Kubernetes master. Can be sourced from KUBE\_HOST | `string` | n/a | yes |
| load\_config\_file | By default the local config (~/.kube/config) is loaded when you use this provider. This option at false disable this behaviour. Can be sourced from KUBE\_LOAD\_CONFIG\_FILE. | `bool` | n/a | yes |
| namespace | The target deamonset namespaces | `string` | n/a | yes |

## Outputs

No output.

