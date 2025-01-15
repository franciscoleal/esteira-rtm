*** Settings ***
Documentation       Essa automação cadastra um informe em volume total de resgate com valor positivo

Resource            ../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL/Cota] Em volume total de resgate inputar valor positivo
    [Tags]    cadplcota
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota com volume total de resgate setado    S0001209906    10
    Validar processamento do informe    Processado
