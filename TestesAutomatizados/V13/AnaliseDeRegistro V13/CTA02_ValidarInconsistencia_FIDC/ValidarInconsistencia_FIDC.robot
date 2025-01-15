*** Settings ***
Documentation      Essa automação valida marcação de inconsistências em fundos enviados no registro - ANBIMA - FDIC

Resource           ../../../Keywords/Keywords.robot
Resource    ../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test02]Validar marcação de inconsistências em fundos enviados no registro - ANBIMA - FIDC
    [Tags]    inconsistencia
    Acessar o HUB    ${EMAIL}
    Selecionar acesso para Administrador    ITAU
    Criar fundo casca valido completo com subclasse FIDC V13
    Enviar para analise anbima
    #Get Register Number
    Alterar acesso para autorregulador
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Acessar analise de cadastro
    Validar apontamento de inconsistencia
    Validar aguardo de informacao da instituicao    FIDC    