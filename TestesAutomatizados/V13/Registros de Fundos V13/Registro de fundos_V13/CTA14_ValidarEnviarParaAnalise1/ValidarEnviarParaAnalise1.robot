*** Settings ***
Documentation      Essa automação valida botão "Enviar para analise da Anbima"

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de fundos][Test14]Validar botão "Enviar para analise da Anbima"  ###Cenário impactado por bug
    [Tags]    test01    test14
    Acessar o HUB    ${EMAIL}
    Selecionar acesso para Administrador    ITAU
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    Renda Fixa    FIF    Monoclasse
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe de renda fixa    teste REFERENCIADO CRED PRIV FC IE Infra IS    teste REFERENCIADO CRED PRIV FC IE Infra IS
    Preencher perfil da classe com argumentos Renda Fixa exterior V13    Renda fixa    Renda Fixa    Renda Fixa Investimento Exterior    Investimento_Exterior    Investimento_Exterior
    Preencher as taxas de administracao da classe V13
    Preencher as taxas de gestao da classe
    Preencher as taxas de custodia da classe
    Preencher as taxas de distribuicao da classe
    Preencher as taxas de performance da classe V13
    Preencher as taxas de entrada e saida da classe
    Preencher as taxas de consultor da classe
    Preencher os prestadores da classe FIF/FIDC
    Concluir classe sem subclasse
    Preencher perfil complementar FIF RF V13
    Preencher valor minimo e movimentacao
    Cadastrar prestadores complementar
    Validar o Cancelar de aceitação
    Finalizar registro
