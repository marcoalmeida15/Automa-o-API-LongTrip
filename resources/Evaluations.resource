*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Variables ***
${server}     http://api.longtrip.loclx.io    
${user_id}    e51be1da-1906-4b91-8c83-039069d426ed
${email}      wriO@carlos.com
${token}      Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7ImVtYWlsIjoibWFycXVpbi4xNUBnbWFpbC5jb20iLCJzdWIiOiJjNjA0NWU3OS05OGM1LTRmOTUtODhlYS0wOWQzNTE1Yzk2ZTUifSwiaWF0IjoxNjgyNjA2NTQ5LCJleHAiOjE2ODUxOTg1NDl9.aCTVmitc9O2LGv6UZLR6ofN60aWxvZK2nFOofvhkzLQ

*** Keywords ***
Criando uma nova avaliação para um usuário ou motorista
    Create Session    alias=Longtrip    url=${server} 

    ${header}    Create Dictionary    Accept=application/json    Authorization=${token}
    ${data}    Create Dictionary    evaluation= 5    description= Corrida otima    tripId= clgzgi52t0003unsgrq07kh3g   passengerId= 35e8559d-8333-45c9-ae37-f5a8cafe63c3    driverId= c6045e79-98c5-4f95-88ea-09d3515c96e5
    ${response}    POST On Session    alias=Longtrip    url=/evaluations  headers=${header}    json=${data}    expected_status= 200 
