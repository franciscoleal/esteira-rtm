*** Settings ***
Documentation      Essa automação tenta validar tela de analise Anbima

Resource           ../../../Keywords/Keywords.robot
Resource    ../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Analise de Registro][Teste06] Validar tela de analise Anbima
    [Tags]    test06
    Acessar o HUB    ${EMAIL}
    Selecionar acesso para Administrador    ITAU
    Criar fundo casca valido completo com subclasse V13
    Alterar acesso para autorregulador
    Clicar na opção fundos
	Alterar acesso para Administrador