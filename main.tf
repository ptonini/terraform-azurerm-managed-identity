resource "azurerm_user_assigned_identity" "this" {
  name                = var.name
  location            = var.rg.location
  resource_group_name = var.rg.name
}

resource "azurerm_role_assignment" "this" {
  for_each             = var.scopes
  principal_id         = azurerm_user_assigned_identity.this.principal_id
  scope                = each.value.scope
  role_definition_name = each.value.role_name
}