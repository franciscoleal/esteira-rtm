*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo Fundos de Cambial com multiplas classes

Resource           ../../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de Fundo]Registrar fundo do tipo Fundos de Cambial com multiplas classes
    Acessar o HUB    vimerson.miura@vericode.com.br
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIF Cambial
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Adicionar multiplas classes sem subclasse    2    Cambial
    Validar tela detalhes do fundo
    Validar classes criadas    2    Cambial
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Validar fundo em analise    FIFCambial
