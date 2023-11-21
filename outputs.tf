output "this" {
  value = azurerm_user_assigned_identity.this
}

output "helm_release_values" {
  value = {
    pod = { labels = { "azure.workload.identity/use" = "true" } }
    serviceaccount = {
      enabled     = true
      annotations = { "azure.workload.identity/client-id" = azurerm_user_assigned_identity.this.client_id }
    }
  }
}