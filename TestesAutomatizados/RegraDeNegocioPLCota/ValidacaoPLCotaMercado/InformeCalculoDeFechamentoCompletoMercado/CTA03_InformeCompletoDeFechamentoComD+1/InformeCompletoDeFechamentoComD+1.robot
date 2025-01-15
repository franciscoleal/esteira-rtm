*** Settings ***
Documentation       Essa automação cadastra um informe completo de fechamento com D+1

Resource            ../../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL/Cota] Informe completo de fechamento em D+1
    [Tags]    cadplcota
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro completo de PLCota    S0001231308    +1    # C0000519162
    Validar exigencia de data dentro dos 180 dias
    Take Screenshot    evidencia_completo_fechamentoD+1.jpg
