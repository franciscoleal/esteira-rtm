*** Settings ***
Documentation      Essa automação valida preenchimento dos campos de taxa Entrada e Saída "Unidade de taxa de entrada" = Percentual

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test24] Validar preenchimento dos campos de taxa Entrada e Saída "Unidade de taxa de entrada" = Percentual
    Acessar o HUB    ${EMAIL}
    Selecionar acesso para Administrador    ITAU
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIF    FIF    Monoclasse
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe de Multimercados    Teste CRED PRIV LP Investimento no Exterior FC    Teste CRED PRIV LP Investimento no Exterior FC
    Preencher perfil da classe com argumentos Registro Multimercado exterior V13     Multimercado    Multimercado    Multimercados Investimento Exterior    Investimento_Exterior    Investimento_Exterior
    Preencher as taxas de administracao da classe V13
    Preencher as taxas de gestao da classe
    Preencher as taxas de custodia da classe
    Preencher as taxas de distribuicao da classe
    Preencher as taxas de performance da classe V13
    Preencher as taxas de entrada Percentual V13
    Preencher as taxas de consultoria especializada da subclasse V13    
    Preencher os prestadores da classe
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse V13
    Preencher perfil da subclasse codigo CVM/B3 Cambial V13
    Preencher taxas Subclasse V13
    Preencher valor minimo e movimentacao
    Cadastrar prestadores da subclasse
    Validar tela detalhes do fundo
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar por CNPJ V13       ${CNPJ_VALIDO}
    Validar fundo em analise    MultimercadosInvestNoExterior
    Alterar o acesso para autorregulador
    Clicar na opção fundos    Solicitações
    Filtrar por CNPJ V13       ${CNPJ_VALIDO}
    Validar campo taxa entrada Percentual    Evidencia_Taxa_Entrada_Percentual
