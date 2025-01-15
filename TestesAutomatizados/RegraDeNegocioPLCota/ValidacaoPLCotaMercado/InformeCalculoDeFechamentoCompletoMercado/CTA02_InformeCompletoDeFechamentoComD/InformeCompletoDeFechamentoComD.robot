*** Settings ***
Documentation       Essa automação cadastra um informe completo de fechamento com D

Resource            ../../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL/Cota] Informe completo de fechamento em D
    [Tags]    cadplcota
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota    S0001231308    # 15    02    2024    0,10    #C0000519162
    Validar processamento do informe    Processado
