param storageAccountName string
param location string = resourceGroup().location
param diskname string = 'defaultDisk'

resource unmanageddisk 'Microsoft.Compute/disks@2020-06-30' = {
  name: diskname
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    creationData:{
      createOption: 'Empty'
    }
    diskSizeGB: 1023
  }
}

resource rslock 'Microsoft.Authorization/locks@2016-09-01' = {
  name: 'diskLock'
  scope: unmanageddisk
  properties:{
    level:'CanNotDelete'
    notes:'Disk should not be deleted'
  }
}