*** Settings ***
Documentation      Essa automação valida preenchimento dos campos de taxa custódia = NÃO Perfil: "Desabilitado"

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Test17] Validar preenchimento dos campos de taxa custódia = NÃO Perfil: "Desabilitado"
    Acessar o HUB    ${EMAIL}
    Selecionar acesso para Administrador    ITAU
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIF    FIF    Monoclasse
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe de renda fixa    teste REFERENCIADO FC CRED PRIV    teste REFERENCIADO FC CRED PRIV
    Preencher perfil da classe com argumentos RF V13    Renda fixa    Renda Fixa    Renda Fixa Duração Alta Crédito Livre    Duracao_Alta    Credito_Livre 
    Preencher não nas taxas da classe V13
    Preencher os prestadores da classe
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse V13
    Preencher perfil da subclasse codigo CVM/B3 ETF V13
    Preencher taxas Subclasse V13
    Preencher valor minimo e movimentacao
    Cadastrar prestadores da subclasse
    Validar tela detalhes do fundo
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar por CNPJ V13       ${CNPJ_VALIDO}
    Validar fundo em analise    RFRendaFixaDividaExterna