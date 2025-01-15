*** Settings ***
Documentation       Essa automação cadastra um informe com um valor zerado de cotistas e PL

Resource            ../../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL COTA - Validação 1º Nível - Número total de cotistas][Test04] Número de cotista igual a zero se PL igual a zero
    [Tags]    nivel1    valcotistas    test03
    Acessar o HUB de mercado    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota informando cotistas e PL zerado today    C0000519162
    # campos com bug impactando a execução
    Validar processamento do informe    Rejeitado
    Acessar informe
    Validar exigencia de cotista maior que zero
