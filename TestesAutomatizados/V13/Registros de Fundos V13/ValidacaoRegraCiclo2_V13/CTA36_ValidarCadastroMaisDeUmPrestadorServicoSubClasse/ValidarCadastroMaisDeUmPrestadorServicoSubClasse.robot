*** Settings ***
Documentation      Essa automação valida Cadastro de mais um prestador de serviço para os papéis definidos como únicos "SubClasse"

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test36] Validar Cadastro de mais um prestador de serviço para os papéis definidos como únicos "SubClasse"
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
    Preencher taxas da classe Renda Fixa V13
    Preencher os prestadores da classe
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse V13
    Preencher perfil da subclasse codigo CVM/B3 Cambial V13
    Preencher taxas Subclasse V13
    Preencher valor minimo e movimentacao
    Cadastrar mais de um prestador da subclasse
    Validar cadastro de mais de um prestador de servico da SubClasse    Evidencia_Cadastro_Prestador_Servico_SubClasse