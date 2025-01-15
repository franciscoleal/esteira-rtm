*** Settings ***
Documentation       Essa automação cadastra um informe com um valor zerado de cotistas e PL diferente de zero

Resource            ../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL COTA - Validação 1º Nível - Número total de cotistas][Test05] Número de cotista igual a zero e PL diferente de zero
    [Tags]    nivel1    valcotistas    test05
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota informando cotistas zerado
    # problema de inconsistência de regra
    Validar processamento do informe    Rejeitado
