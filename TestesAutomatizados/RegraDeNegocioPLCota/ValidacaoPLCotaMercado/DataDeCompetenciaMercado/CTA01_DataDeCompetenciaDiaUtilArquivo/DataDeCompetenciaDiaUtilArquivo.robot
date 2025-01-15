*** Settings ***
Documentation       Essa automação cadastra um informe de arquivo com data competência em dia útil

Resource            ../../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL COTA - Validação 1º Nível - Regra Dia Útil][Test01] Informe de arquivo com data competência em dia útil
    [Tags]    nivel1    diautil    teste01
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Informe diario com arquivo
    Validar processamento do informe    Processado
