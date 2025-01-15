*** Settings ***
Documentation       Essa automação cadastra um Informe completo de abertura com D

Resource            ../../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL/Cota] Informe completo de abertura em D
    [Tags]    cadplcota
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro completo de PLCota    S0001231308    1    # C0000055451
    Validar processamento do informe    Processado
