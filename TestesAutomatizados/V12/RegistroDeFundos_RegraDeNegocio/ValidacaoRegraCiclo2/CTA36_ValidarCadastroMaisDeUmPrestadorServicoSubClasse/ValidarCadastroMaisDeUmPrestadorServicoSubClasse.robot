*** Settings ***
Documentation      Essa automação valida Cadastro de mais um prestador de serviço para os papéis definidos como únicos "SubClasse"

Resource           ../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test36] Validar Cadastro de mais um prestador de serviço para os papéis definidos como únicos "SubClasse"
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
    Preencher as taxas de entrada e saida da subclasse Nao Se Aplica
    Preencher as taxas de consultoria especializada
    Preencher valor minimo e movimentacao
    Cadastrar mais de um prestador da subclasse
    Validar cadastro de mais de um prestador de servico da SubClasse    Evidencia_Cadastro_Prestador_Servico_SubClasse