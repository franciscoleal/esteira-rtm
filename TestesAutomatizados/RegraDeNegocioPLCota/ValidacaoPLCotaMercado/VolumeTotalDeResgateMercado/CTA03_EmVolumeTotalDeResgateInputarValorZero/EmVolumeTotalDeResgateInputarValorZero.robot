*** Settings ***
Documentation       Essa automação cadastra um informe em volume total de resgate com valor zero

Resource            ../../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL/Cota] Em volume total de resgate inputar valor zero
    [Tags]    cadplcota
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota    C0000519162    # 05/02/2024
    Validar processamento do informe    Processado
