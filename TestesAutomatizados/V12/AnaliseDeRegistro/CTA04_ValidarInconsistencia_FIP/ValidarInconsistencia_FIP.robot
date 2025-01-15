*** Settings ***
Documentation      Essa automação valida marcação de inconsistências em fundos enviados no registro - ANBIMA - FIP

Resource           ../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test04]Validar marcação de inconsistências em fundos enviados no registro - ANBIMA - FIP
    [Tags]    inconsistencia
    Acessar o HUB    daniele.negoro@vericode.com.br
    Criar fundo casca valido completo com subclasse FIP
    Enviar para analise anbima
    #Get Register Number
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Acessar analise de cadastro
    Validar apontamento de inconsistencia
    Validar aguardo de informacao da instituicao    FIP	