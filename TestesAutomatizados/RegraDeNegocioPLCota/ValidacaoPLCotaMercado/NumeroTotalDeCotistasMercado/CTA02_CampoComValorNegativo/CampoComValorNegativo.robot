*** Settings ***
Documentation       Essa automação cadastra um informe com um valor negativo de cotistas

Resource            ../../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL COTA - Validação 1º Nível - Número total de cotistas][Test02] Campo com valor negativo
    [Tags]    nivel1    valcotistas    test02
    Acessar o HUB de mercado    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota informando cotistas negativos    C0000519162
