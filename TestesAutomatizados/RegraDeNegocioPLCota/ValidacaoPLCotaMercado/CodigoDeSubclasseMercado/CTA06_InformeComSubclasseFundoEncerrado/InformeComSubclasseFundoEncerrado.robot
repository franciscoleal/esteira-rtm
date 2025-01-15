*** Settings ***
Documentation       Essa automação cadastra um informe com um código de subclasse de um fundo encerrado

Resource            ../../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL COTA - Validação 1º Nível - Código de Subclasse][Test04] Informe com subclasse de um fundo encerrado
    [Tags]    nivel1    codsubclasse    test06
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota    S0000448567
    Validar processamento do informe    Rejeitado
    Acessar informe
    Pause Execution
    Validar exigencia de classe ou subclasse cadastrado no HUB
