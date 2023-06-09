*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Variables ***
${server}            http://api.longtrip.loclx.io    
${user_id}           e51be1da-1906-4b91-8c83-039069d426ed
${email}             wriO@carlos.com
${token}             Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7ImVtYWlsIjoibWFycXVpbjE1QGdtYWlsLmNvbSIsInN1YiI6ImRlZDdiZGQyLTFjMTMtNDY3Yy05MWNmLWY3NGUyNmE3ZjlkZCJ9LCJpYXQiOjE2ODU3MzA4MDcsImV4cCI6MTY4ODMyMjgwN30.EeT5HIQBxmdJB_GyQOnOXWVmBxnzitSnxOy29aZtQiw
${id_motorista}      c6045e79-98c5-4f95-88ea-09d3515c96e5  
${id_passageiro}     35e8559d-8333-45c9-ae37-f5a8cafe63c3  
${trip_id}           cli3517nm0016unvkdxd2kbtt
${driver_id}         c6045e79-98c5-4f95-88ea-09d3515c96e5

*** Keywords ***
Criar nova corrida
    Create Session    alias=Longtrip    url=${server} 

    ${header}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${data}    Create Dictionary    
    ...    origin=Rua Quinze de Novembro, 1630 - Glória, Osório - RS, Brazil    
    ...    lat=${-29.9012611} 
    ...    lng=${-50.2669706}    
    ...    latDest=${-29.9175629}    
    ...    lngDest=${-51.17761600000001}   
    ...    destination=Avenida Getúlio Vargas, 5501 - Centro, Canoas - RS, Brazil  
    ...    date=15/05/2023    
    ...    time=19:00   
    ...    cost=${50}   
    ...    seats=${4}  
    ...    driverId=${driver_id}     
    ...    carInfoId=${6}   
    ...    description=Com paradas nos principais pontos turísticos  
    ...    tripType=DRIVER
    ${response}    POST On Session   alias=Longtrip    url=/trips    headers=${header}    json=${data}    expected_status= 201
    Set Suite Variable    ${newtrip}    ${response.json().get("tripId")}

Obter uma viagem por id do motorista
    Create Session    alias=Longtrip    url=${server}
    ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${response}    GET On Session    alias=Longtrip    url=/trips/driver/${driver_id}    headers=${headers}    expected_status=200

Obter uma viagem por id do passageiro
    Create Session    alias=Longtrip    url=${server}
    ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${response}    GET On Session    alias=Longtrip    url=/trips/passenger/${id_passageiro}      headers=${headers}    expected_status=200

Obter viagens por id de usuário
    Create Session    alias=Longtrip    url=${server}
    ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${response}    GET On Session    alias=Longtrip    url=/trips/type/DRIVER     headers=${headers}    expected_status=200

Obter viagens por endereço
    Create Session    alias=Longtrip    url=${server}
    ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${response}    GET On Session    alias=Longtrip    url=/trips/origin/Rua Quinze de Novembro, 1630 - Glória, Osório - RS, Brazil/destination/Avenida Getúlio Vargas, 5501 - Centro, Canoas - RS, Brazil//seats/3     headers=${headers}    expected_status=200

Obter viagens por endereço com filtros
    Create Session    alias=Longtrip    url=${server}
    ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${response}    GET On Session    alias=Longtrip    url=/trips/origin/Rua Quinze de Novembro, 1630 - Glória, Osório - RS, Brazil/destination/Avenida Getúlio Vargas, 5501 - Centro, Canoas - RS, Brazil//seats/3/:Preferences     headers=${headers}    expected_status=200

Obter detalhes de uma viagem
    Create Session    alias=Longtrip    url=${server}
    ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${response}    GET On Session    alias=Longtrip    url=/trips/details/${trip_id}    headers=${headers}    expected_status=200

Obter perfil de uma viagem
    Create Session    alias=Longtrip    url=${server}
    ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${response}    GET On Session    alias=Longtrip    url=/trips/profile/${trip_id}    headers=${headers}    expected_status=200

Cancelar viagem
    Create Session    alias=Longtrip    url=${server}
    ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${data}       Create Dictionary    
    ...    origin=Rua Quinze de Novembro, 1630 - Glória, Osório - RS, Brazil"
    ...    lat=-29.9012611
    ...    lng=-50.2669706
    ...    latDest=-29.9175629
    ...    lngDest=-51.17761600000001
    ...    destination=Avenida Getúlio Vargas, 5501 - Centro, Canoas - RS, Brazil
    ...    date=27/04/2023
    ...    time=19:00
    ...    cost=50
    ...    seats=4
    ...    driverId=${driver_id} 
    ...    carInfoId=6
    ...    description=Com paradas nos principais pontos turísticos.
    ...    tripType=DRIVER

    ${response}    POST On Session    alias=Longtrip    url=/trips/cancel/${newtrip}    headers=${headers}    expected_status=201

Atribuir passageiro a viagem
    Create Session    alias=Longtrip    url=${server}
    ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${data}       Create Dictionary    
    ...    driverId=${driver_id}
    ...    passengerId=${id_passageiro}
    ...    tripsId=${trip_id} 
    ${response}    POST On Session    alias=Longtrip    url=/trips/assign    headers=${headers}    json=${data}    expected_status=201

Aceitar passageiro
    Create Session    alias=Longtrip    url=${server}
    ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${data}       Create Dictionary   
    ...    tripId=${trip_id} 
    ...    passengerId=${id_passageiro} 
    ${response}    POST On Session    alias=Longtrip    url=/trips/accept-passenger    headers=${headers}    json=${data}    expected_status=201

Remover passageiro
    Create Session    alias=Longtrip    url=${server}
    ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${data}       Create Dictionary 
    ...    passengerId=${id_passageiro}
    ...    tripId=${trip_id}  
    ${response}    POST On Session    alias=Longtrip    url=/trips/remove    headers=${headers}    json=${data}    expected_status=201


