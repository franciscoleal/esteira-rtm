*** Settings ***
Documentation      Essa automação valida campos habilitados de acordo com o tipo do fundo  - FIP

Resource           ../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test004]Validar campos habilitados de acordo com o tipo do fundo - FIP
    Acessar o HUB    vimerson.miura@vericode.com.br
    Selecionar acesso para Administrador    ITAU
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIP    FIP
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe com argumentos    Teste     Teste 
    Preencher perfil da classe com argumento validando campos habilitados    FIP    FIP    Fundos de Participações    vazia    vazia
    Preencher as taxas da classe ETF
    Preencher os prestadores da classe
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse
    Preencher perfil da subclasse ETF e FII e Offshore
    Preencher as taxas de administracao da classe
    Preencher as taxas de gestao da classe
    Preencher as taxas de custodia da classe
    Preencher as taxas de distribuicao da classe
    Preencher as taxas de performance da subclasse ETF
    Preencher as taxas de entrada e saida da subclasse
    Preencher as taxas de consultoria especializada
    Preencher valor minimo e movimentacao FIP
    Cadastrar prestadores da subclasse
    Validar tela detalhes do fundo
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Validar fundo em analise    FIPFundosDeParticipacoes