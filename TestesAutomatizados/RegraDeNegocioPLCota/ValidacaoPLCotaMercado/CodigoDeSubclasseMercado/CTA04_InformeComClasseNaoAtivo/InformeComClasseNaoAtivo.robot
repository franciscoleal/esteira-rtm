*** Settings ***
Documentation       Essa automação cadastra um informe com um código de classe não ativo

Resource            ../../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL COTA - Validação 1º Nível - Código de Subclasse][Test04] Informe de fundo com classe não ativa
    [Tags]    nivel1    codclasse    test04
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota    C0000413623
    Validar processamento do informe    Rejeitado
    Acessar informe
    Validar exigencia de classe ou subclasse cadastrado no HUB
