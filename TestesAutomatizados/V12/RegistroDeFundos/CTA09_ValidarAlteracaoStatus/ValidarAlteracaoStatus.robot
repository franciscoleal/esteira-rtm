*** Settings ***
Documentation      Essa automação valida alteração de status Etapas preenchimento

Resource           ../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de fundos][Test09]Validar alteração de status Etapas preenchimento
    [Tags]    test09
    Acessar o HUB    daniele.negoro@vericode.com.br
    Selecionar acesso    Administrador
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Validar status cinza
    Preencher os dados cadastrais
    Validar status verde
    Voltar
    Validar status amarelo
