*** Settings ***
Documentation    Essa automação cadastra um informe simplificado de fechamento com D+1

Resource    ../../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[PL/Cota] Informe simplificado de fechamento com D+1
    [Tags]    cadplcota
    Acessar o HUB de mercado    joao.marques-ext@anbima.com.br
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro simplificado de fechamento    C0000519162
    Validar processamento do informe    Rejeitado
    Acessar informe
    Validar exigencia de valor de abertura
    Take Screenshot    evidencia_Rejeitado.jpg