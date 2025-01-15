*** Settings ***
Documentation      Essa automação valida tamanho de campos que não são select box ou arquivo no conteúdo

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test04] Validar tamanho de campos que não são select box ou arquivo no conteúdo  
    Acessar o HUB    ${EMAIL}
    Selecionar acesso para Administrador    ITAU
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIF    FIF    Monoclasse
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe acoes no exterior V13
    Preencher perfil da classe com argumentos no exterior V13    Ações    Ações    Ações Investimento Exterior    Investimento_Exterior    Investimento_Exterior
    Preencher taxas da classe Registros V13 
    Preencher os prestadores da classe
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse V13
    Preencher perfil da subclasse codigo CVM/B3 acoes V13
    Preencher taxas Subclasse V13
    Preencher valor minimo e movimentacao FIF Ações
    Cadastrar prestadores da subclasse
    Validar se registro possui inconsistencia V13
    Validar tela detalhes do fundo
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar por CNPJ V13       ${CNPJ_VALIDO}
    Validar fundo em analise    AcoesInvestNoExterior
