*** Settings ***
Documentation       Essa automação cadastra um informe com competência igual ultimo dia do mês

Resource            ../../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
# Test Teardown    Fechar o navegador


*** Test Cases ***
[PL COTA - Validação 1º Nível - Regra Dia Útil][Test11] Informe com competência igual ultimo dia do mês
    [Tags]    nivel1    diautil    teste11
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota com competencia igual ultimo dia do mes mercado
    Validar processamento do informe    Processado
