*** Settings ***
Documentation      Essa automação valida marcação de aprovação em fundos enviados no registro - ANBIMA - FII

Resource           ../../../Keywords/Keywords.robot
Resource    ../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Test09]Validar marcação de Aprovação em fundos enviados no registro - ANBIMA - FII
    [Tags]    aprovacao
    Acessar o HUB    ${EMAIL}
    Selecionar acesso para Administrador    ITAU
    Criar fundo casca valido completo com subclasse FII V13
    Enviar para analise anbima
    #Get Register Number
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Acessar analise de cadastro
    Aprovar registro
    Alterar acesso para Administrador
    Clicar na opção fundos
    Filtrar status Aprovado    Aprovado
    Validar aprovacao do registro    FII
    