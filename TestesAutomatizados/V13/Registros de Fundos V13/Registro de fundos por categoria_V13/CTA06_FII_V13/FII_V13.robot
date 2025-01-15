*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo FII

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de Fundo]Registrar fundo do tipo FII
    Acessar o HUB    ${EMAIL}
    Selecionar acesso    ITAU UNIBANCO SA
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FII    FII    Monoclasse
    Preencher perfil do fundo
    Preencher os prestadores FII
    Preencher os documentos Regulamento
    Concluir o fundo casca
    Preencher os dados cadastrais da classe    teste FIAGRO
    Preencher perfil da classe com argumentos completo FII V13   FII    FII    Tijolo Renda Gestão Ativa    Indexados    Indices
    Preencher taxas FII V13
    Preencher os prestadores da classe FIF/FIDC
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse V13
    Preencher perfil da subclasse codigo CVM/B3 ETF V13
    Preencher taxas Subclasse V13
    Preencher valor minimo e movimentacao FIDC
    Cadastrar prestadores da subclasse FIDC
    Validar tela detalhes do fundo
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Validar fundo em analise    FII
