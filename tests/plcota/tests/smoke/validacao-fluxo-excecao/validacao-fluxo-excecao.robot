*** Settings ***
Resource            ../../../../../main.robot

Test Setup          Navegador-config.Abrir o navegador
Test Teardown       Navegador-config.Fechar o navegador

*** Test Cases ***
Validar Fluxo de exceção
    [Documentation]
    ...    Fundo diário
    ...    datas de competências anterior a 180 dias a partir da data atual
    ...    O envio de justificativa para este cenário deverá ser feito por arquivo e por tela
    Dado que envio um arquivo de exceção
    Quando troco para Autorregulador e aprovo
    Então o informe foi enviado com sucesso


