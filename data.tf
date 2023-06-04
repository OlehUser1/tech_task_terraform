data "azurerm_key_vault" "key_vault" {
  name                = "my-main-keyvault"
  resource_group_name = "oleh_key_vault"
}

data "azurerm_key_vault_secret" "sql_admin_password" {
  name         = "sql-admin-password"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}