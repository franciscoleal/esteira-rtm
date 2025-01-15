*** Settings ***
Documentation       Essa automação cadastra um informe simplificado em D+1 para fundo de abertura

Resource            ../../../Keywords/Keywords.robot
Resource            ../../../../main.robot

Test Setup          Abrir o navegador
# Test Teardown    Fechar o navegador


*** Test Cases ***
[PL/Cota] Informe simplificado em D+1 para fundo de abertura
    [Tags]    cadplcota
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro simplificado de PLCota    C0000055700    +1
    Validar processamento do informe    Processado
