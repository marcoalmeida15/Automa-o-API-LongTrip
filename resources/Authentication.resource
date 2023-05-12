*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Variables ***
${server}    http://api.longtrip.loclx.io  

*** Keywords ***
Criando acess token
    Create Session    alias=Longtrip    url=${server} 

    ${header}    Create Dictionary    Content-Type=application/json
    ${data}    Create Dictionary    email=sctY@carlos.com    password=123456789    

    ${response}    POST On Session    alias=Longtrip    url=/authentication/login   headers=${header}    json=${data}
    Should Be Equal As Strings    ${response.status_code}    201
    ${response_json}=    Set Variable    ${response.json()}