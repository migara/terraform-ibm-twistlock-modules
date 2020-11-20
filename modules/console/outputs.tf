output console_ip {
  value = kubernetes_service.this.load_balancer_ingress[0].ip
}

output console_hostname {
  value = kubernetes_service.this.load_balancer_ingress[0].hostname
}

output kubernetes_service {
  value = kubernetes_service.this
}
