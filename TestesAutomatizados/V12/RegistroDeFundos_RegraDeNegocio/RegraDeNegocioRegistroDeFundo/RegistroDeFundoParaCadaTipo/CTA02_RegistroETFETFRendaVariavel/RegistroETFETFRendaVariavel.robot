*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo Fundos de ETF - Renda Variável

Resource           ../../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de Fundo]Registrar fundo do tipo Fundos de ETF Renda Variável
    Acessar o HUB    vimerson.miura@vericode.com.br
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    ETF    ETF
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe com argumentos    Teste     Teste 
    Preencher perfil da classe com argumentos ETF   ETF    ETF    ETF Renda Variável    Vazia    Vazia
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
    Preencher as taxas de entrada e saida da subclasse ETF ou FII ou Offshore
    Preencher as taxas de consultoria especializada
    Preencher valor minimo e movimentacao ETF ou Offshore
    Cadastrar prestadores da subclasse
    Validar tela detalhes do fundo
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Validar fundo em analise    ETFRendaVariavel
