*** Settings ***
Documentation       Essa automação cadastra um informe simplificado em D

Resource            ../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL/Cota] Informe simplificado em D
    [Tags]    cadplcota
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro simplificado de PLCota    C0000055700
    Validar processamento do informe    Processado
