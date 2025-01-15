*** Settings ***
Documentation       Essa automação cadastra um informe completo em D-1

Resource            ../../../../main.robot

Test Setup          Navegador-Config.Abrir o navegador
Test Teardown       Navegador-Config.Fechar o navegador


*** Test Cases ***
[PL/Cota] Informe completo de abertura em D-1
    [Tags]    cadplcota
    Login.Acessar o HUB    ${EMAIL}    ${LINK_HUB_UAT}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Keywords.Preencher cadastro completo de PLCota    C0000055700    -1
    Validar processamento do informe    Processado
