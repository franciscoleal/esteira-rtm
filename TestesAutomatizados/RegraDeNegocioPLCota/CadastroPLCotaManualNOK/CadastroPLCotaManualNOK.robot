*** Settings ***
Documentation       Essa automação cadastra uma PL/Cota Manualmente com dados não ok

Resource            ../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL/Cota] Cadastrar uma PL/Cota Manualmente com dados não ok
    [Tags]    cadplcota
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota nao ok    S0000259721
    Validar cadastro da PLCota
