*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo Previdencia Balanceados de 15 a 30

Resource           ../../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de Fundo]Registrar fundo do tipo Previdencia Balanceados de 15 a 30
    Acessar o HUB    vimerson.miura@vericode.com.br
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    Previdencia Balanceados de 15 a 30    FIF
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe previdencia
    Preencher perfil da classe com argumentos previdencia    Ações    Previdência    Previdência Balanceados 15-30    previdencia    balanceados_15_30
    Preencher as taxas da classe
    Preencher os prestadores da classe
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse
    Preencher perfil da subclasse previdencia
    Preencher as taxas de administracao da classe
    Preencher as taxas de gestao da classe
    Preencher as taxas de custodia da classe
    Preencher as taxas de distribuicao da classe
    Preencher as taxas de performance da subclasse performance
    Preencher as taxas de entrada e saida da subclasse
    Preencher as taxas de consultoria especializada da subclasse
    Preencher valor minimo e movimentacao
    Cadastrar prestadores da subclasse
    Validar tela detalhes do fundo
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Validar fundo em analise    PrevidenciaBalanceadosDe15a30
