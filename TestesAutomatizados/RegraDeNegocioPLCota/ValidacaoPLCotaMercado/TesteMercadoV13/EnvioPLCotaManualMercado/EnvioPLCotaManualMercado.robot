*** Settings ***
Documentation      Essa automação cadastra uma PL/Cota Manualmente

Resource           ../../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[PL/Cota] Cadastrar uma PL/Cota Manualmente
    [Tags]    cadplcota
    Acessar o HUB de mercado    joao.marques-ext@anbima.com.br
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota    C0000764027
    Validar processamento do informe manual    Processado    StatusDoInforme