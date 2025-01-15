*** Settings ***
Documentation      Essa automação realiza o upload de um arquivo de Informe PL/Cota (formato válido)

Resource           ../../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[PL/Cota] Upload de um arquivo de Informe PL/Cota (formato válido)
    [Tags]    test16
    Acessar o HUB    joao.marques-ext@anbima.com.br
    Acessar o PLCota
    Informe diario com arquivo selecionado    PLCOTA    xlsx
    validar processamento do informe por arquivo    Processado