*** Settings ***
Documentation      Essa automação valida marcação de inconsistências em fundos enviados no registro - ANBIMA - ETF
Resource           ../../../Keywords/Keywords.robot
Resource    ../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test05]Validar marcação de inconsistências em fundos enviados no registro - ANBIMA - ETF
    [Tags]    inconsistencia
    Acessar o HUB    ${EMAIL}
    Selecionar acesso para Administrador    ITAU
    Criar fundo casca valido completo com subclasse ETF V13
    Enviar para analise anbima
    #Get Register Number
    Alterar acesso para autorregulador
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Acessar analise de cadastro
    Validar apontamento de inconsistencia
    Validar aguardo de informacao da instituicao    ETF