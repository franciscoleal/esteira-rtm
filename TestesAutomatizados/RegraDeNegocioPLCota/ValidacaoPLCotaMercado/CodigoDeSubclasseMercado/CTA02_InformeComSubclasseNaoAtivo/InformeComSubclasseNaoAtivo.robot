*** Settings ***
Documentation       Essa automação cadastra um informe com um código de subclasse não ativo

Resource            ../../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL COTA - Validação 1º Nível - Código de Subclasse][Test02] Informe com subclasse não ativo
    [Tags]    nivel1    codsubclasse    test01
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota    S0001073737
    Validar processamento do informe    Rejeitado
