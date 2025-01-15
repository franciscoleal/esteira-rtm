*** Settings ***
Documentation       Essa automação cadastra um informe simplificado de fechamento com D

Resource            ../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL/Cota] Informe simplificado de fechamento com D
    [Tags]    cadplcota
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro simplificado de fechamento    C0000000779    +1
    Validar processamento do informe    Rejeitado
    Acessar informe
    Validar exigencia de valor de abertura
    Take Screenshot    evidencia_Rejeitado.jpg
