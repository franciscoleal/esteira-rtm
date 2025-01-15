*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo FII

Resource           ../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de Fundo]Registrar fundo do tipo FII
    Acessar o HUB   daniele.negoro@vericode.com.br
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FII    FII
    Preencher perfil do fundo
    Preencher os prestadores FII
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe
    Preencher perfil da classe FII
    Preencher as taxas da classe
    Preencher os prestadores da classe FII
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse
    Preencher perfil da subclasse FII
    Preencher as taxas de administracao da classe
    Preencher as taxas de gestao da classe
    Preencher as taxas de custodia da classe
    Preencher as taxas de distribuicao da classe
    Preencher as taxas de performance da subclasse
    Preencher as taxas de entrada e saida da subclasse FII
    Preencher as taxas de consultoria especializada FII ou Offshore
    Preencher valor minimo e movimentacao FII
    Cadastrar prestadores da subclasse FII
    Validar tela detalhes do fundo
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Validar fundo em analise    FII
