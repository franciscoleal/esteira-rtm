*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo Fundos de FIDC com multiplas classes

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de Fundo]Registrar fundo do tipo Fundo de FIDC com multiplas classes
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIDC    FIDC    Multiclasses
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos FIDC V13
    Concluir o fundo casca
    Adicionar multiplas subclasses no registro FIDC V13    4
    Validar tela detalhes do fundo
    Validar subclases criadas V13    FIDC
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Validar fundo em analise    FIDC
