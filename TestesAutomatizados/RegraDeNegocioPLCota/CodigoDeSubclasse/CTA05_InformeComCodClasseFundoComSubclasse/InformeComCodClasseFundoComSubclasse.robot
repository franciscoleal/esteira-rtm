*** Settings ***
Documentation       Essa automação cadastra um informe com um código de classe de um fundo com subclasse

Resource            ../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL COTA - Validação 1º Nível - Código de Subclasse][Test05] Informe de fundo com cód. de classe e que possui subclasse
    [Tags]    nivel1    codclasse    test05
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota    C0001209744
    Validar processamento do informe    Rejeitado
    Acessar informe
    Validar exigencia de subclasse para fundo que possui subclasse
