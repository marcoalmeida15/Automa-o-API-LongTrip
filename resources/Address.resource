*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Variables ***
${server}      http://api.longtrip.loclx.io   

*** Keywords ***
Pegando endereço
    Create Session    alias=Longtrip    url=${server} 
    ${headers}    Create Dictionary    Accept=application/json    Authorization=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7ImVtYWlsIjoibWFycXVpbi4xNUBnbWFpbC5jb20iLCJzdWIiOiJjNjA0NWU3OS05OGM1LTRmOTUtODhlYS0wOWQzNTE1Yzk2ZTUifSwiaWF0IjoxNjgyNjA2NTQ5LCJleHAiOjE2ODUxOTg1NDl9.aCTVmitc9O2LGv6UZLR6ofN60aWxvZK2nFOofvhkzLQ    
    ${response}    GET On Session  alias=Longtrip        url=/address/search?address=Rua Quinze de Novembro, 1630 - Glória, Osório - RS, Brazil    headers=${headers}    expected_status= 200  

Pegando endereço com preenchimento automático
    Create Session    alias=Longtrip    url=${server} 
    ${headers}    Create Dictionary    Accept=application/json    Authorization=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7ImVtYWlsIjoibWFycXVpbi4xNUBnbWFpbC5jb20iLCJzdWIiOiJjNjA0NWU3OS05OGM1LTRmOTUtODhlYS0wOWQzNTE1Yzk2ZTUifSwiaWF0IjoxNjgyNjA2NTQ5LCJleHAiOjE2ODUxOTg1NDl9.aCTVmitc9O2LGv6UZLR6ofN60aWxvZK2nFOofvhkzLQ    
    ${response}    GET On Session  alias=Longtrip        url=/address/autocomplete?input=getúlio vargas 5501, canoas    headers=${headers}    expected_status= 200  
