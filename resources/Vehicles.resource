*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Variables ***
${server}            http://api.longtrip.loclx.io    
${user_id}           e51be1da-1906-4b91-8c83-039069d426ed
${email}             wriO@carlos.com
${token}             Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7ImVtYWlsIjoibWFycXVpbjE1QGdtYWlsLmNvbSIsInN1YiI6ImRlZDdiZGQyLTFjMTMtNDY3Yy05MWNmLWY3NGUyNmE3ZjlkZCJ9LCJpYXQiOjE2ODU3MzA4MDcsImV4cCI6MTY4ODMyMjgwN30.EeT5HIQBxmdJB_GyQOnOXWVmBxnzitSnxOy29aZtQiw
${id_driver}         48
${id_motorista}      c6045e79-98c5-4f95-88ea-09d3515c96e5 

*** Keywords ***

Obter marcas disponíveis
    Create Session    alias=Longtrip    url=${server}
    ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${response}    GET On Session    alias=Longtrip    url=/vehicles/cars/available-makes   headers=${headers}    expected_status=200

Obter modelos por marca
    Create Session    alias=Longtrip    url=${server}
    ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${response}    GET On Session    alias=Longtrip    url=/vehicles/cars/models/161   headers=${headers}    expected_status=200

Obter anos disponíveis por marca e modelo
    Create Session    alias=Longtrip    url=${server}
    ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${response}    GET On Session    alias=Longtrip    url=/vehicles/cars/available-years/161/9040   headers=${headers}    expected_status=200

Criar um novo carro
    Create Session    alias=Longtrip    url=${server} 

    ${header}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${data}    Create Dictionary    userId=${id_motorista}     category=car    model=Civic    make=Honda    year=2020    color=Black    imageUrl=https://firebasestorage.googleapis.com/v0/b/long-trip-4985d.appspot.com/o/profile-image%2Fc89a28ab-e8b0-4026-b662-9fe8912397f69219004419421042296.jpg    licensePlate=ABC1234
    ${response}    POST On Session    alias=Longtrip    url=/vehicles/cars/create    headers=${header}    json=${data}
    Set Suite Variable    ${newcar}    ${response.json().get("id")}

Obter um carro por id
    Create Session    alias=Longtrip    url=${server}
    ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${response}    GET On Session    alias=Longtrip    url=/vehicles/cars/${newcar}   headers=${headers}    expected_status=200

Obter todos os carros por id de usuário
    Create Session    alias=Longtrip    url=${server}
    ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${response}    GET On Session    alias=Longtrip    url=/vehicles/cars/user/${user_id}    headers=${headers}    expected_status=200

Atualizando um carro
    Create Session    alias=Longtrip    url=${server} 

    ${header}    Create Dictionary    Accept=application/json    Authorization=${token} 
    ${data}      Create Dictionary    
    ...    userId=${id_motorista}  
    ...    category=car
    ...    model=Civic
    ...    make=Honda
    ...    year=2020
    ...    color=Black
    ...    imageUrl=https://firebasestorage.googleapis.com/v0/b/long-trip-4985d.appspot.com/o/profile-image%2Fc89a28ab-e8b0-4026-b662-9fe8912397f69219004419421042296.jpg
    ...    licensePlate=ABC1234
    
    ${response}    PUT On Session   alias=Longtrip    url=/vehicles/cars/update/${newcar}     headers=${header}    json=${data}    expected_status=200

Deletando um carro
   Create Session    alias=Longtrip    url=${server} 

    ${header}    Create Dictionary    Accept=application/json    Authorization=${token}       
    ${response}    DELETE On Session   alias=Longtrip    url=/vehicles/cars/delete/${newcar}     headers=${header}    expected_status=204

Obter todas as categorias
    Create Session    alias=Longtrip    url=${server}
    ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${response}    GET On Session    alias=Longtrip    url=/vehicles/categories    headers=${headers}    expected_status=200