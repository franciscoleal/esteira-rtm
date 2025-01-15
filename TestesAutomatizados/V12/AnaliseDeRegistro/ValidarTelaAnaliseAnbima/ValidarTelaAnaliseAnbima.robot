*** Settings ***
Documentation      Essa automação tenta validar tela de analise Anbima

Resource           ../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Analise de Registro][Teste06] Validar tela de analise Anbima
    [Tags]    test06
    Acessar o HUB    daniele.negoro@vericode.com.br
    Criar fundo casca valido completo com subclasse
    Alterar acesso para autorregulador
    #Selecionar Sysadmin
    Clicar na opção fundos
	Alterar acesso para Administrador