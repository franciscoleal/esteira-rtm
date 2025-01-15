*** Settings ***
Documentation      Essa automação valida barra horizontal tela registro fundo Casca

Resource           ../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de fundos][Test7]Validar barra horizontal tela registro fundo Casca
    [Tags]    teste07
    Acessar o HUB    daniele.negoro@vericode.com.br
    Selecionar acesso    Administrador
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Validar barra horizontal do registro fundo casca
