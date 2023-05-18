*** Settings ***
Resource    ../resources/Users.resource

*** Test Cases ***
Cenário 01 - Cadastrando um novo usuário
    Criar um novo usuário
    Colocar "," no email antes do .com
    Colocar "," no email no lugar do @

Cenário 02 - Buscando usuário por ID
    Buscando usuário por ID

Cenário 03 - Atualizando Usuário
    Atualizar usuário

Cenário 04 - Validando email
    Validando se e-mail está em uso

Cenário 05 - Buscando usuário por email
    Buscando usuário por email

Cenário 06 - Obtendo preferências do usuário
    Obtendo preferências do usuário

Cenário 07 - Atualizando preferências do usuário
    Atualizando preferências do usuário

Cenário 08 - Obtendo perfil do usuário
    Obter perfil do usuário