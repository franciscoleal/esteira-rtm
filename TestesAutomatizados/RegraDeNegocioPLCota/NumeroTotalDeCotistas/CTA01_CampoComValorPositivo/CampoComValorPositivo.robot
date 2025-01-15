*** Settings ***
Documentation       Essa automação cadastra um informe com um valor positivo de cotistas

Resource            ../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL COTA - Validação 1º Nível - Número total de cotistas][Test01] Campo com valor positivo
    [Tags]    nivel1    valcotistas    test01
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota    S0001209906
    Validar processamento do informe    Processado
