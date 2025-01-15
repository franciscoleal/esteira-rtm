*** Settings ***
Documentation      Essa automação valida em tela se os campos alocados corretamente em cada seção do Fundo (casca), Classe e Subclasse

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test01] Validar em tela se os campos alocados corretamente em cada seção do Fundo (casca), Classe e Subclasse
    Acessar o HUB    ${EMAIL}
    Selecionar acesso para Administrador    ITAU
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIF    FIF    Monoclasse
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe    MERCADO DE ACESSO BDR Nível 1
    Preencher perfil da classe com argumentos V13    Ações    Ações    Ações Indexados    Indexados    Indices
    Preencher taxas da classe Registros V13
    Preencher os prestadores da classe
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse V13
    Preencher perfil da subclasse codigo CVM/B3 acoes V13
    Preencher taxas Subclasse V13
    Preencher valor minimo e movimentacao FIF Ações
    Cadastrar prestadores da subclasse
    Validar tela detalhes do fundo
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar por CNPJ V13       ${CNPJ_VALIDO}
    Validar fundo em analise    AcoesIndexados