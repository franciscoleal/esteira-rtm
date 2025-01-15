*** Settings ***
Documentation      Essa automação valida marcação de inconsistências em fundos enviados na Alteração - ANBIMA - FIF

Resource    ../../../../main.robot

Test Setup         Navegador-Config.Abrir o navegador
Test Teardown      Navegador-Config.Fechar o navegador

*** Test Cases ***

[Test01]Validar marcação de inconsistências em fundos enviados na Alteração - ANBIMA - FIF
    [Tags]    inconsistencia
    Login.Acessar o HUB    ${EMAIL}    ${LINK_HUB_V14}
    Profile.Alterar o perfil    Perfil=Administrador    Instituicao=ITAU    menu=1
    Skip
    Criar fundo casca valido completo com subclasse
    Enviar para analise anbima
    Get Register Number
    Keywords.Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Acessar analise de cadastro
    Aprovar registro
    Alterar acesso para adm
    Keywords.Efetuar alteração no fundo aprovado
    Keywords.Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtro avançado para alteracao
    Analisar alteracao
    Validar apontamento de inconsistencia    FIF