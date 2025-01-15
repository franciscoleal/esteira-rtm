*** Settings ***
Documentation       Essa automação cadastra um informe com um valor zerado de cotistas

Resource            ../../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL COTA - Validação 1º Nível - Número total de cotistas][Test03] Campo com valor zerado
    [Tags]    nivel1    valcotistas    test03
    Acessar o HUB de mercado    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota informando cotistas zerado    C0000519162
    Validar processamento do informe    Rejeitado
    Acessar informe
    Validar exigencia de cotista maior que zero
