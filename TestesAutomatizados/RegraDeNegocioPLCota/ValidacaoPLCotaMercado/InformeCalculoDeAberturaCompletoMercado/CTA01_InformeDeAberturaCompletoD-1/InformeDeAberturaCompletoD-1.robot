*** Settings ***
Documentation       Essa automação cadastra um informe completo em D-1

Resource            ../../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL/Cota] Informe completo de abertura em D-1
    [Tags]    cadplcota
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro completo de PLCota    S0001231308    -1    # C0000055451
    Validar processamento do informe    Processado
