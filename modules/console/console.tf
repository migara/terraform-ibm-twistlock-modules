resource kubernetes_deployment this {

  metadata {
    name      = "twistlock-console"
    namespace = var.namespace
    labels = {
      name = "twistlock-console"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        name = "twistlock-console"
      }
    }

    strategy {
      type = "Recreate"
    }

    template {
      metadata {
        name      = "twistlock-console"
        namespace = "twistlock"
        labels = {
          name = "twistlock-console"
        }
      }

      spec {
        restart_policy       = "Always"
        service_account_name = "twistlock-console"

        container {
          image = var.twistclok_console_image
          name  = "twistlock-console"

          port {
            name           = "mgmt-https"
            container_port = 8083
          }

          port {
            name           = "communication"
            container_port = 8084
          }

          env {
            name  = "CONFIG_PATH"
            value = "/data/config/twistlock.cfg"
          }

          env {
            name  = "LOG_PROD"
            value = "true"
          }

          env {
            name  = "DATA_RECOVERY_ENABLED"
            value = "true"
          }

          env {
            name  = "COMMUNICATION_PORT"
            value = "8084"
          }

          env {
            name  = "MANAGEMENT_PORT_HTTPS"
            value = "8083"
          }

          env {
            name  = "MANAGEMENT_PORT_HTTP"
            value = ""
          }

          security_context {
            read_only_root_filesystem = "true"
          }

          volume_mount {
            name       = "twistlock-config-volume"
            mount_path = "/data/config/"
          }

          volume_mount {
            name       = "console-persistent-volume"
            mount_path = "/var/lib/twistlock"
            sub_path   = "var/lib/twistlock"
          }

          volume_mount {
            name       = "console-persistent-volume"
            mount_path = "/var/lib/twistlock-backup"
            sub_path   = "var/lib/twistlock-backup"
          }

          volume_mount {
            name       = "syslog-socket"
            mount_path = "/dev/log"
          }
        }

        dynamic image_pull_secrets {
          for_each = var.image_pull_secrets
          content {
            name = image_pull_secrets.value
          }
        }

        volume {
          name = "console-persistent-volume"
          persistent_volume_claim {
            claim_name = "twistlock-console"
          }
        }

        volume {
          name = "twistlock-config-volume"
          config_map {
            name = "twistlock-console"
          }
        }

        volume {
          name = "syslog-socket"
          host_path {
            path = "/dev/log"
          }
        }

      }
    }
  }
}
