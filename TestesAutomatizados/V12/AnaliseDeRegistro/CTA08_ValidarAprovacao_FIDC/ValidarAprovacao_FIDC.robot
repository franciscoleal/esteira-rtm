*** Settings ***
Documentation      Essa automação valida aprovação de fundo enviados no registro - ANBIMA - FIDC

Resource           ../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test08]Validar aprovação de fundo enviados no registro - ANBIMA - FIDC
    [Tags]    aprovacao
    Acessar o HUB    daniele.negoro@vericode.com.br
    Criar fundo casca valido completo com subclasse FIDC
    Enviar para analise anbima
    Get Register Number
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Acessar analise de cadastro
    Aprovar registro
    Validar aprovacao do registro    ValidarAprovacao_FIDC
    Alterar acesso para administrador
    