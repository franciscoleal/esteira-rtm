*** Settings ***
Documentation       Essa automação cadastra uma informe simplificado em data maior que D+1

Resource            ../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL/Cota] Informe simplificado em data maior que D+1
    [Tags]    cadplcota
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro simplificado de PLCota    S0001231308    +1
    Validar processamento do informe    Rejeitado
