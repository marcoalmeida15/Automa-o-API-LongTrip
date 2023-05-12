*** Settings ***
Resource    ../resources/Vehicles.resource

*** Test Cases ***

Cenário 01 - Obtendo marcas disponíveis
    Obter marcas disponíveis

Cenário 02 - Obtendo modelos por marca
    Obter modelos por marca

Cenário 03 - Obtendo anos disponíveis por marca e modelo
    Obter anos disponíveis por marca e modelo