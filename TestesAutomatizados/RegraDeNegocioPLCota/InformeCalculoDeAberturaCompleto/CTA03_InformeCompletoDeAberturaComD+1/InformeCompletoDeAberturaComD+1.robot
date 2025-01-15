*** Settings ***
Documentation       Essa automação cadastra um Informe completo de abertura com D+1

Resource            ../../../Keywords/Keywords.robot
Resource            ../../../../main.robot

Test Setup          Navegador-Config.Abrir o navegador
Test Teardown       Navegador-Config.Fechar o navegador


*** Test Cases ***
[PL/Cota] Informe completo de abertura em D+1
    [Tags]    cadplcota
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Keywords.Preencher cadastro completo de PLCota    S0001163752    +1
    Keywords.Validar exigencia de data dentro dos 180 dias
    ScreenCapLibrary.Take Screenshot
