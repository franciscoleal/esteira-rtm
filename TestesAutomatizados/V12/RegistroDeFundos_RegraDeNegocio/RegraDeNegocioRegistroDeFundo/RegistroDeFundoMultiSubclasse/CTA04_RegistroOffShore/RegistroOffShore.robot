*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo Fundos de Offshore com multiplas subclasses

Resource           ../../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de Fundo]Registrar fundo do tipo Fundo de Offshore com multiplas subclasses
    Acessar o HUB    vimerson.miura@vericode.com.br
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais Offshore
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Adicionar multiplas subclasses no registro Offshore    4
    Validar tela detalhes do fundo
    Validar subclases criadas    Offshore
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Validar fundo em analise    OffShoreRendaMista
