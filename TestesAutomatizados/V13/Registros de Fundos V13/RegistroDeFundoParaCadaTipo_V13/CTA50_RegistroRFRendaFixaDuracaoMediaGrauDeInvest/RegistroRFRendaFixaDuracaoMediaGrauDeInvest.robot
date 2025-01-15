*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo RF Renda Fixa Duração Média Grau de Invest

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Registro de Fundo]Registrar fundo do tipo RF Renda Fixa Duração Média Grau de Invest
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIF Renda Fixa    FIF    Monoclasse
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe de renda fixa    teste REFERENCIADO CRED PRIV FC IE Infra IS    teste REFERENCIADO CRED PRIV FC IE Infra IS
    Preencher perfil da classe com argumentos RF Divida Externa V13    Renda fixa    Renda Fixa    Renda Fixa Duração Média Grau Invest    Duracao_Media    Grau_Investimento
    Alterar o preenchimento das taxas da classe para subclasse
    Preencher os prestadores da classe
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse V13
    Preencher perfil da subclasse codigo CVM/B3 ETF V13
    Preencher taxas da classe Renda Fixa V13
    Preencher valor minimo e movimentacao
    Cadastrar prestadores da subclasse    
    Validar tela detalhes do fundo
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar por CNPJ V13       ${CNPJ_VALIDO}
    Validar fundo em analise    RFDuracaoMediaGrauInvest