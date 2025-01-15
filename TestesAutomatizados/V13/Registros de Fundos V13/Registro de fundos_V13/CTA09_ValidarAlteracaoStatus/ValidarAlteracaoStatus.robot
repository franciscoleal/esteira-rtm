*** Settings ***
Documentation      Essa automação valida alteração de status Etapas preenchimento

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de fundos][Test09]Validar alteração de status Etapas preenchimento
    [Tags]    test09
    Acessar o HUB    ${EMAIL}
    Selecionar acesso    Administrador
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Validar status cinza
    Preencher os dados cadastrais    FII    FII    Monoclasse
    Validar status verde
    Preencher perfil do fundo
    Preencher os prestadores
    Voltar
    Validar status amarelo
