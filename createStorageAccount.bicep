@minLength(3)
@maxLength(24)
@description('Specify a storage account name')
param storageAccountName string


resource stg 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: storageAccountName
  location: 'eastus'
  tags:{
    displayName: 'storageaccount1'
  }
  sku:{
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  kind: 'Storage'
}