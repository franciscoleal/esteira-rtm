*** Settings ***
Documentation       Essa automação cadastra um informe imputado em tela com data de competência em dia NÃO útil

Resource            ../../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL COTA - Validação 1º Nível - Regra Dia Útil][Test04] Informe imputado em tela com data de competência em dia NÃO útil
    [Tags]    nivel1    diautil    teste04
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota dia nao util
    Validar processamento do informe    Rejeitado
    Acessar informe
    Validar inconsistencia de dia não util
