*** Settings ***
Documentation       Essa automação cadastra um informe com um código de subclasse ativo

Resource            ../../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL COTA - Validação 1º Nível - Código de Subclasse][Test01] Informe com subclasse ativo
    [Tags]    nivel1    codsubclasse    test01
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota    S0001231308
    Validar processamento do informe    Processado
