*** Settings ***
Documentation      Essa automação valida campos habilitados de acordo com o tipo do fundo - OFFSHORE

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
Validar campos habilitados de acordo com o tipo do fundo - OFFSHORE
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais Offshore
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos Regulamento
    Concluir o fundo casca
    Preencher os dados cadastrais da classe Offshore    Teste Classe de Cotas CIC LP    Teste Classe de Cotas CIC LP
    Preencher perfil da classe validando campos habilitados Offshore V13    Offshore    Offshore    Offshore Renda Mista    vazia    vazia
    Preencher taxas da classe RegistrosOffShore V13
    Preencher os prestadores da classe
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse V13
    Preencher perfil da subclasse codigo CVM/B3 OffShore V13
    Preencher taxas Subclasse V13
    Preencher valor minimo e movimentacao ETF ou Offshore
    Cadastrar prestadores da subclasse
    Validar tela detalhes do fundo
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar por CNPJ V13       ${CNPJ_VALIDO}
    Validar fundo em analise    OffShoreRendaMista