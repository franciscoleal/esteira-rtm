*** Settings ***
Documentation       Essa automação cadastra um informe completo de fechamento com D-1

Resource            ../../../Keywords/Keywords.robot
Resource            ../../../../main.robot

Test Setup          Navegador-Config.Abrir o navegador
Test Teardown       Navegador-Config.Fechar o navegador


*** Test Cases ***
[PL/Cota] Informe completo de fechamento em D-1
    [Tags]    cadplcota
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Keywords.Preencher cadastro completo de PLCota    C0000000779    -1
    Keywords.Validar processamento do informe    Processado
