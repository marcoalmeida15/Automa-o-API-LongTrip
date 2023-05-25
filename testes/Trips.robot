*** Settings ***
Resource    ../resources/Trips.resource

*** Test Cases ***
Cenário 01 - Criando uma nova corrida
    Criar nova corrida

Cenário 02 - Obtendo viagem por Id motorista
    Obter uma viagem por id do motorista

Cenário 03 - Obtendo viagem por Id passageiro
    Obter uma viagem por id do passageiro

Cenário 04 - Obtendo viagens por id de usuário
    Obter viagens por id de usuário

Cenário 05 - Obtendo viagens por endereço
    Obter viagens por endereço

Cenário 06 - Obtendo viagens por endereço com filtros
    Obter viagens por endereço com filtros

Cenário 07 - Obtendo detalhes de uma viagem
    Obter detalhes de uma viagem

Cenário 08 - Obtendo perfil de uma viagem
    Obter perfil de uma viagem

Cenário 09 - Atribuindo passageiro a viagem
    Atribuir passageiro a viagem 

Cenário 10 - Aceitando passageiro
    Aceitar passageiro

Cenário 11 - Removendo passageiro
    Remover passageiro

Cenário 12 - Cancelando uma viagem
    Cancelar viagem