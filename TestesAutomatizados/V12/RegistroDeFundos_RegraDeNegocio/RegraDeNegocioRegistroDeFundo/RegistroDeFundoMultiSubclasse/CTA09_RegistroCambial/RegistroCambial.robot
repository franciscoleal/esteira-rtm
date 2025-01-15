*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo Fundos de Cambial com multiplas subclasses

Resource           ../../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de Fundo]Registrar fundo do tipo Fundos de Cambial com multiplas subclasses
    Acessar o HUB    vimerson.miura@vericode.com.br
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIF Cambial
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Adicionar multiplas subclasses no registro Cambial    4
    Validar tela detalhes do fundo
    Validar subclases criadas    Cambial
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Validar fundo em analise    FIFCambial
