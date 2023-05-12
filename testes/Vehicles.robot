*** Settings ***
Resource    ../resources/Vehicles.resource

*** Test Cases ***

Cenário 01 - Obtendo marcas disponíveis
    Obter marcas disponíveis

Cenário 02 - Obtendo modelos por marca
    Obter modelos por marca

Cenário 03 - Obtendo anos disponíveis por marca e modelo
    Obter anos disponíveis por marca e modelo

Cenário 04 - Criando um novo carro
    Criar um novo carro

Cenário 05 - Obtendo um carro por id
    Obter um carro por id

Cenário 06 - Obtendo todos os carros por id de usuário
    Obter todos os carros por id de usuário

Cenário 07 - Atualizando um carro
    Atualizando um carro

Cenário 08 - Deletando um carro
    Deletando um carro

Cenário 09 - Obtendo todas as categorias
    Obter todas as categorias