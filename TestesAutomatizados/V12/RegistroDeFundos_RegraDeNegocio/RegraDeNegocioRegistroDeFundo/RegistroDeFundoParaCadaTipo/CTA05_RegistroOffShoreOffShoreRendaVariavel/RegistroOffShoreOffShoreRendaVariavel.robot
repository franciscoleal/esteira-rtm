*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo Off-Shore Renda Variável

Resource           ../../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Registro de Fundo]Registrar fundo do tipo Off-Shore Renda Variável
    Acessar o HUB    vimerson.miura@vericode.com.br
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais Offshore
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe Offshore    teste    teste
    Preencher perfil da classe com argumentos Offshore    Offshore    Offshore    Offshore Renda Variável    vazia    vazia
    Preencher as taxas da classe
    Preencher os prestadores da classe
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse Offshore
    Preencher perfil da subclasse ETF e FII e Offshore
    Preencher as taxas de administracao da classe
    Preencher as taxas de gestao da classe
    Preencher as taxas de custodia da classe
    Preencher as taxas de distribuicao da classe
    Preencher as taxas de performance da subclasse performance
    Preencher as taxas de entrada e saida da subclasse ETF ou FII ou Offshore
    Preencher as taxas de consultoria especializada FII ou Offshore
    Preencher valor minimo e movimentacao ETF ou Offshore
    Cadastrar prestadores da subclasse
    Validar tela detalhes do fundo
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Validar fundo em analise    OffShoreRendaVariável