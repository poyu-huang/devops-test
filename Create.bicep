resource symbolicname 'Microsoft.ApiManagement/service@2021-12-01-preview' = {
  name: 'string'
  location: 'string'
  tags: {
    tagName1: 'tagValue1'
    tagName2: 'tagValue2'
  }
  sku: {
    capacity: int
    name: 'string'
  }
  identity: {
    type: 'string'
    userAssignedIdentities: {}
  }
  properties: {
    additionalLocations: [
      {
        disableGateway: bool
        location: 'string'
        publicIpAddressId: 'string'
        sku: {
          capacity: int
          name: 'string'
        }
        virtualNetworkConfiguration: {
          subnetResourceId: 'string'
        }
        zones: [
          'string'
        ]
      }
    ]
    apiVersionConstraint: {
      minApiVersion: 'string'
    }
    certificates: [
      {
        certificate: {
          expiry: 'string'
          subject: 'string'
          thumbprint: 'string'
        }
        certificatePassword: 'string'
        encodedCertificate: 'string'
        storeName: 'string'
      }
    ]
    customProperties: {}
    disableGateway: bool
    enableClientCertificate: bool
    hostnameConfigurations: [
      {
        certificate: {
          expiry: 'string'
          subject: 'string'
          thumbprint: 'string'
        }
        certificatePassword: 'string'
        certificateSource: 'string'
        certificateStatus: 'string'
        defaultSslBinding: bool
        encodedCertificate: 'string'
        hostName: 'string'
        identityClientId: 'string'
        keyVaultId: 'string'
        negotiateClientCertificate: bool
        type: 'string'
      }
    ]
    notificationSenderEmail: 'string'
    privateEndpointConnections: [
      {
        id: 'string'
        name: 'string'
        properties: {
          privateEndpoint: {}
          privateLinkServiceConnectionState: {
            actionsRequired: 'string'
            description: 'string'
            status: 'string'
          }
        }
        type: 'string'
      }
    ]
    publicIpAddressId: 'string'
    publicNetworkAccess: 'string'
    publisherEmail: 'string'
    publisherName: 'string'
    restore: bool
    virtualNetworkConfiguration: {
      subnetResourceId: 'string'
    }
    virtualNetworkType: 'string'
  }
  zones: [
    'string'
  ]
}
