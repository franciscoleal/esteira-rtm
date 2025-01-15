*** Settings ***
Documentation      Essa automação valida marcação de inconsistências em fundos enviados no registro - ANBIMA - OFFSHORE
Resource           ../../../Keywords/Keywords.robot
Resource    ../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test06]Validar marcação de inconsistências em fundos enviados no registro - ANBIMA - OFFSHORE
    [Tags]    inconsistencia
    #cenário com bug
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Criar fundo casca valido completo com subclasse OFFSHORE V13
    Enviar para analise anbima
    Get Register Number
    Validar perfil    Autorregulador
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao offshore 
    Acessar solicitacao
    Acessar analise de cadastro
    Validar apontamento de inconsistencia
    Validar aguardo de informacao da instituicao    OFFSHORE    