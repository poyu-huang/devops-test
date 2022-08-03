// Define an existing APIM
resource My_APIM 'Microsoft.ApiManagement/service@2021-08-01' existing= {
  name: 'midasAPIManagement'
}

//Home Backend Function Definition
resource Test_Function_Home_Backend 'Microsoft.ApiManagement/service/backends@2021-12-01-preview' = {
  
  parent: My_APIM
  name:'test-backend-home'
  properties:{
    credentials:{
      header:{ //function app - app keys
        'x-functions-key':[
          '8Gsodvjm5LCX0dlpfgdrgCzBKh2g/PBZ9dfwtiuTrek47ur1WNInQA=='
        ]
      }
    }
    protocol:'http'
    url:'https://gymidashome.azurewebsites.net/api' //url + \api
    resourceId:'https://management.azure.com/subscriptions/20cdb7ea-ca01-433e-9286-8474f4e72f58/resourceGroups/MidasFunctionApp/providers/Microsoft.Web/sites/gymidashome'//function app resource id - json view
    description:'test-home-function'
  }
}


//Home Function App Definition
resource service_midasAPIManagement_name_gymidashome 'Microsoft.ApiManagement/service/apis@2021-12-01-preview' = {
  parent: My_APIM
  name: 'gymidashome'
  properties: {
    displayName: 'gymidashome'
    apiRevision: '1'
    description: 'Import from "gymidashome" Function App'
    subscriptionRequired: false
    path: 'home'
    protocols: [
      'https'
    ]
    isCurrent: true
  }
}

// Add or update an operation
resource service_midasAPIManagement_Function1 'Microsoft.ApiManagement/service/apis/operations@2021-12-01-preview' = {
  parent: service_midasAPIManagement_name_gymidashome
  name: 'GET-operation'
  properties: {
    displayName: 'TestGet'
    method: 'GET'
    urlTemplate: '/home-function/get/test-getfunc'
    templateParameters: []
    responses: []
}
}


resource service_midasAPIManagement_FunctionPost1 'Microsoft.ApiManagement/service/apis/operations@2021-12-01-preview' = {
  parent: service_midasAPIManagement_name_gymidashome
  name: 'POST1-operation'
  properties: {
    displayName: 'TestPost1'
    method: 'POST'
    urlTemplate: '/home-function/post1'
    templateParameters: []
    responses: []
}
}


//with parameter
resource service_midasAPIManagement_FunctionPostName 'Microsoft.ApiManagement/service/apis/operations@2021-12-01-preview' = {
  parent: service_midasAPIManagement_name_gymidashome
  name: 'POSTName-operation'
  properties: {
    displayName: 'TestPostName'
    method: 'POST'
    urlTemplate: '/home-function/post/{name}'
    templateParameters: [
      {
        name: 'name'
        required: true
        values: []
        type: ''
      }
    ]
    responses: []
}
}

//Policy Definition
resource policy 'Microsoft.ApiManagement/service/apis/operations/policies@2021-12-01-preview' = {
  name: 'policy'
  parent: service_midasAPIManagement_Function1
  properties: {
    format: 'xml'
    value: '<policies><inbound><base /><set-backend-service id="apim-generated-policy" backend-id="test-backend-home" /></inbound><backend><base /></backend><outbound><base /></outbound><on-error><base /></on-error></policies>'
  }
}

//backend post1
resource policyPost 'Microsoft.ApiManagement/service/apis/operations/policies@2021-12-01-preview' = {
  name: 'policy'
  parent: service_midasAPIManagement_FunctionPost1
  properties: {
    format: 'xml'
    value: '<policies><inbound><base /><set-backend-service id="apim-generated-policy" backend-id="test-backend-home" /></inbound><backend><base /></backend><outbound><base /></outbound><on-error><base /></on-error></policies>'
  }
}

//backend postName
resource policyPostName 'Microsoft.ApiManagement/service/apis/operations/policies@2021-12-01-preview' = {
  name: 'policy'
  parent: service_midasAPIManagement_FunctionPostName
  properties: {
    format: 'xml'
    value: '<policies><inbound><base /><set-backend-service id="apim-generated-policy" backend-id="test-backend-home" /></inbound><backend><base /></backend><outbound><base /></outbound><on-error><base /></on-error></policies>'
  }
}
