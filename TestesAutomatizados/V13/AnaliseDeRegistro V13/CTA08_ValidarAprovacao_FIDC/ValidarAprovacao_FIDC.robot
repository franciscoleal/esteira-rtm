*** Settings ***
Documentation      Essa automação valida aprovação de fundo enviados no registro - ANBIMA - FIDC

Resource           ../../../Keywords/Keywords.robot
Resource    ../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test08]Validar aprovação de fundo enviados no registro - ANBIMA - FIDC
    [Tags]    aprovacao
    Acessar o HUB    ${EMAIL}
    Selecionar acesso para Administrador    ITAU
    Criar fundo casca valido completo com subclasse FIDC V13
    Enviar para analise anbima
    Get Register Number
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Acessar analise de cadastro
    Aprovar registro
    Alterar acesso para Administrador
    Clicar na opção fundos
    Filtrar status Aprovado    Aprovado
    Validar aprovacao do registro    ValidarAprovacao_FIDC    
    