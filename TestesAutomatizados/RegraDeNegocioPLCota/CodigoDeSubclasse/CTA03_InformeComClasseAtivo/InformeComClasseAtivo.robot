*** Settings ***
Documentation       Essa automação cadastra um informe com um código de classe ativo

Resource            ../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL COTA - Validação 1º Nível - Código de Subclasse][Test03] Informe de fundo com classe ativo
    [Tags]    nivel1    codclasse    test03
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota    S0001209906
    Validar processamento do informe    Processado
