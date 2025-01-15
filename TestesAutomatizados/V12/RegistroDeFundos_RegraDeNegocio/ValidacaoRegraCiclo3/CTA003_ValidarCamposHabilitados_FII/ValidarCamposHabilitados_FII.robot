*** Settings ***
Documentation      Essa automação valida campos habilitados de acordo com o tipo do fundo  - FII

Resource           ../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Test003]Validar campos habilitados de acordo com o tipo do fundo - FII
    Acessar o HUB    vimerson.miura@vericode.com.br
    Selecionar acesso para Administrador    ITAU
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FII    FII
    Preencher perfil do fundo
    Preencher os prestadores FII
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe com argumentos    teste    teste
    Preencher perfil da classe com argumento validando campos habilitados    FII    FII    Tijolo Desenvolvimento Gestão Definida    vazia    vazia
    Preencher as taxas da classe
    Preencher os prestadores da classe FII
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse
    Preencher perfil da subclasse ETF e FII e Offshore
    Preencher as taxas de administracao da classe
    Preencher as taxas de gestao da classe
    Preencher as taxas de custodia da classe
    Preencher as taxas de distribuicao da classe
    Preencher as taxas de performance da subclasse performance
    Preencher as taxas de entrada e saida da subclasse ETF ou FII ou Offshore
    Preencher as taxas de consultoria especializada FII ou Offshore
    Preencher valor minimo e movimentacao FIDC ou FII
    Cadastrar prestadores da subclasse FII
    Validar tela detalhes do fundo
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Validar fundo em analise    FIITijoloDesenvolvimentoGestaoDefinida