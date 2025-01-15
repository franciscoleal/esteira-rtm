*** Settings ***
Documentation       Essa automação cadastra uma informe simplificado em data menor que D

Resource            ../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL/Cota] Informe simplificado em data menor que D
    [Tags]    cadplcota
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro simplificado de PLCota    C0000055700    -1
    Validar exigencia de dia util da PLCota
    Take Screenshot    simplificado_aberturaD-1.jpg
