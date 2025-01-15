*** Settings ***
Documentation      Essa automação cadastra um informe de arquivo com data competência em dia NÃO útil

Resource           ../../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[PL COTA - Validação 1º Nível - Regra Dia Útil][Test03] Informe de arquivo com data competência em dia NÃO útil
    [Tags]    nivel1    diautil    teste03
    Acessar o HUB de mercado    joao.marques-ext@anbima.com.br
    Acessar o PLCota
    Informe diario com arquivo nao util
    Validar processamento do informe por arquivo    Rejeitado
    Acessar informe
    Validar inconsistencia de dia não util