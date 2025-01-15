*** Settings ***
Documentation       Essa automação cadastra um informe com competência diferente do último dia do mês

Resource            ../../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
# Test Teardown    Fechar o navegador


*** Test Cases ***
[PL COTA - Validação 1º Nível - Regra Dia Útil][Test10] Informe com competência diferente do ultimo dia do mês
    [Tags]    nivel1    diautil    teste10
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota com competencia diferente do ultimo dia do mes mercado
    Validar exigencia de data diferente do ultimo dia do mes
