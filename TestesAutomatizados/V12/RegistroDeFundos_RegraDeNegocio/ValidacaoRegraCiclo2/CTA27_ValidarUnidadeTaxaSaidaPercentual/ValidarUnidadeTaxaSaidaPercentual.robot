*** Settings ***
Documentation      Essa automação valida preenchimento dos campos de taxa Entrada e Saída "Unidade da taxa de saída" = Percentual

Resource           ../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test27] Validar preenchimento dos campos de taxa Entrada e Saída "Unidade da taxa de saída" = Percentual
    Acessar o HUB    vimerson.miura@vericode.com.br
    Selecionar acesso para Administrador    ITAU
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIF Multimercado
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe    Teste CRED PRIV LP FC IE    Teste CRED PRIV LP FC IE
    Preencher perfil da classe com argumentos completo    Multimercado    Multimercado    Multimercados Investimento Exterior    INVESTIMENTO_EXTERIOR    INVESTIMENTO_EXTERIOR
    Preencher as taxas da classe
    Preencher os prestadores da classe
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse
    Preencher perfil da subclasse
    Preencher as taxas de administracao da classe
    Preencher as taxas de gestao da classe
    Preencher as taxas de custodia da classe
    Preencher as taxas de distribuicao da classe
    Preencher as taxas de performance da subclasse
    Preencher as taxas de entrada e saida da subclasse 
    Preencher as taxas de consultoria especializada
    Preencher valor minimo e movimentacao
    Cadastrar prestadores da subclasse
    Validar tela detalhes do fundo
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Validar fundo em analise    FIFMultimercado
    Alterar o acesso para autorregulador
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao no perfil autorregulador
    Validar campo taxa saida Percentual    Evidencia_Taxa_saida_Percentual