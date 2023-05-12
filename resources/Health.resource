*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Variables ***
${server}    http://api.longtrip.loclx.io    

*** Keywords ***
Vendo se o servidor está on
    Create Session    alias=Longtrip    url=${server}         
    ${headers}    Create Dictionary    Accept=application/json    Authorization=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7ImVtYWlsIjoibWFycXVpbi4xNUBnbWFpbC5jb20iLCJzdWIiOiJjNjA0NWU3OS05OGM1LTRmOTUtODhlYS0wOWQzNTE1Yzk2ZTUifSwiaWF0IjoxNjgyNjA2NTQ5LCJleHAiOjE2ODUxOTg1NDl9.aCTVmitc9O2LGv6UZLR6ofN60aWxvZK2nFOofvhkzLQ    
    ${response}    GET On Session  alias=Longtrip        url=/health    headers=${headers}    expected_status= 200