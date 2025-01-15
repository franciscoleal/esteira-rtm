*** Settings ***
Documentation       Essa automação cadastra um Informe completo de abertura com D+1

Resource            ../../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL/Cota] Informe completo de abertura em D+1
    [Tags]    cadplcota
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro completo de PLCota    C0000055451    +1
    Validar exigencia de data dentro dos 180 dias
    Take Screenshot    evidencia_completo_aberturaD+1.jpg
