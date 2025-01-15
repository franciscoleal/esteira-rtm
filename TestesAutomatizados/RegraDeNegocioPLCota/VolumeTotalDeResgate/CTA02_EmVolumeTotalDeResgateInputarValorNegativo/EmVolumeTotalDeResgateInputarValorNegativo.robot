*** Settings ***
Documentation       Essa automação cadastra um informe em volume total de resgate com valor negativo

Resource            ../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL/Cota] Em volume total de resgate inputar valor negativo
    [Tags]    cadplcota
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota com o campo volume total resgate negativo    S0001209906    05    02    2024
    Validar exigencia de total de resgate positivo
