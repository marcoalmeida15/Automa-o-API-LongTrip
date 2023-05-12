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