*** Settings ***
Documentation       Essa automação cadastra um informe com    data anterior a 180 dias

Resource            ../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
# Test Teardown    Fechar o navegador


*** Test Cases ***
[PL COTA - Validação 1º Nível - Regra Dia Útil][Test09] Informe com data anterior a 180 dias
    [Tags]    nivel1    diautil    teste09
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota data anterior a 180 dias
    Validar exigencia de data dentro dos 180 dias
