*** Settings ***
Documentation       Essa automação cadastra um informe imputado em tela com data de competência em dia útil

Resource            ../../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL COTA - Validação 1º Nível - Regra Dia Útil][Test02] Informe imputado em tela com data de competência em dia útil
    [Tags]    nivel1    diautil    teste02
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota    S0001231308    # C0000519162
    Validar processamento do informe    Processado
