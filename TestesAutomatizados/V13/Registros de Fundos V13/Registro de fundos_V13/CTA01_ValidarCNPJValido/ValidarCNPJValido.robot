*** Settings ***
Documentation      Essa automação valida registro cadastro fundo Casca CNPJ Válido

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de fundos][Test01]Validar registro cadastro fundo Casca CNPJ Válido
    [Tags]    teste01
    Acessar o HUB    ${EMAIL}
    Selecionar acesso    Administrador
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FII    FII    Monoclasse
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Verificar status do fundo
    
    