*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo Previdencia Balanceados Data Alvo

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de Fundo]Registrar fundo do tipo Previdencia Balanceados Data Alvo
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    Previdencia Balanceados Data Alvo    FIF    Monoclasse
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe    teste, BDR Nível 1, MERCADO DE ACESSO, IE, PREV Responsabilidade Limitada PREVIDENCIA
    Preencher perfil da classe com argumentos previdencia V13    Ações    Previdência    Previdência Ações Ativo    ACOES_ATIVOS    ATIVOS
    Alterar o preenchimento das taxas da classe para subclasse
    Preencher os prestadores da classe
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse V13
    Preencher perfil da subclasse codigo CVM/B3 acoes V13
    Preencher taxas da classe Registros FIF PREV V13
    Preencher valor minimo e movimentacao
    Cadastrar prestadores da subclasse
    Validar tela detalhes do fundo
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Validar fundo em analise    PrevidenciaBalanceadosDataAlvo
