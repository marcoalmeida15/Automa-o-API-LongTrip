*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Variables ***
${server}     http://api.longtrip.loclx.io    
${user_id}    e51be1da-1906-4b91-8c83-039069d426ed
${email}      wriO@carlos.com
${token}      Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7ImVtYWlsIjoibWFycXVpbi4xNUBnbWFpbC5jb20iLCJzdWIiOiJjNjA0NWU3OS05OGM1LTRmOTUtODhlYS0wOWQzNTE1Yzk2ZTUifSwiaWF0IjoxNjgyNjA2NTQ5LCJleHAiOjE2ODUxOTg1NDl9.aCTVmitc9O2LGv6UZLR6ofN60aWxvZK2nFOofvhkzLQ
${id_passageiro}     35e8559d-8333-45c9-ae37-f5a8cafe63c3

*** Keywords ***
Criar um novo usuário
    ${random_string}=    Generate Random String    length=4    chars=[LETTERS]    
    ${email}=    Set Variable    ${random_string}\@carlos.com

    Create Session    alias=Longtrip    url=${server} 

    ${header}    Create Dictionary    Content-Type=application/json
    ${data}    Create Dictionary    name=Marcu    lastName=Rubens    password=123456789    imageUrl=https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png    dateOfBirth=15/06/2000    gender=Masculino    cellPhone=51997459023   email=${email}

    ${response}    POST On Session    alias=Longtrip    url=/users/create   headers=${header}    json=${data}    expected_status= 201

Colocar "," no email antes do .com
    ${random_string}=    Generate Random String    length=4    chars=[LETTERS]    
    ${email}=    Set Variable    ${random_string}\@carlos,com

    Create Session    alias=Longtrip    url=${server}

    ${header}    Create Dictionary    Content-Type=application/json
    ${data}    Create Dictionary    name=Marcu    lastName=Rubens    password=123456789    imageUrl=https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png    dateOfBirth=15/06/2000    gender=Masculino    cellPhone=51997459023   email=${email}

    ${response}    POST On Session    alias=Longtrip    url=/users/create   headers=${header}    json=${data}    expected_status= 400 

Colocar "," no email no lugar do @
    ${random_string}=    Generate Random String    length=4    chars=[LETTERS]    
    ${email}=    Set Variable    ${random_string}\,carlos.com
    
    Create Session    alias=Longtrip    url=${server}

    ${header}    Create Dictionary    Content-Type=application/json
    ${data}    Create Dictionary    name=Marcu    lastName=Rubens    password=123456789    imageUrl=https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png    dateOfBirth=15/06/2000    gender=Masculino    cellPhone=51997459023   email=${email}

    ${response}    POST On Session    alias=Longtrip    url=/users/create   headers=${header}    json=${data}    expected_status=400

Buscando usuário por ID
    Create Session    alias=Longtrip    url=${server}
    ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${response}    GET On Session    alias=Longtrip    url=/users/${user_id}   headers=${headers}    expected_status=200

Atualizar usuário
    Create Session    alias=Longtrip    url=${server} 

    ${header}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${data}    Create Dictionary     name=Lauro    lastName=Ricardo    password=123456789    imageUrl=https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png    dateOfBirth=15/06/2000    gender=Masculino    cellPhone=51997459023   email=wriO@carlos.com   
    ${response}    PATCH On Session   alias=Longtrip    url=/users/update/${user_id}   headers=${header}    json=${data}    expected_status=200    

Validando se e-mail está em uso
    Create Session    alias=Longtrip    url=${server} 

    ${header}    Create Dictionary    Content-Type=application/json
    ${data}    Create Dictionary    email=marco.toto123@icloud.com

    ${response}    POST On Session    alias=Longtrip    url=/users/validate-email    headers=${header}    json=${data}    expected_status=200

Buscando usuário por email
    Create Session    alias=Longtrip    url=${server}
    ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${response}    GET On Session    alias=Longtrip    url=/users/find-by-email/${email}   headers=${headers}    expected_status=200
    
Obtendo preferências do usuário
    Create Session    alias=Longtrip    url=${server}
    ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${response}    GET On Session    alias=Longtrip    url=/users/preferences/${user_id}   headers=${headers}    expected_status=200

Atualizando preferências do usuário
    Create Session    alias=Longtrip    url=${server} 

    ${header}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${data}    Create Dictionary    id=${id_passageiro}    conversation=true     music=true     smoking=true     pets=true     hadVaccines=true    eatFood=true  
        
    ${response}    PUT On Session   alias=Longtrip    url=/users/preferences    headers=${header}    json=${data}    expected_status=200 
    
Obter perfil do usuário
    Create Session    alias=Longtrip    url=${server}
    ${headers}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${response}    GET On Session    alias=Longtrip    url=/users/profile/${user_id}   headers=${headers}    expected_status=200