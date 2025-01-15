*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo FIDC

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de Fundo]Registrar fundo do tipo FIDC
    Acessar o HUB    ${EMAIL}
    Selecionar acesso    ITAU UNIBANCO SA
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIDC    FIDC    Monoclasse
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos Registro FIDC V13
    Concluir o fundo casca
    Preencher os dados cadastrais da classe fidc
    Preencher perfil da classe com argumentos completo FIDC V13   FIDC    FIDC    Financeiro    Indexados    Indices
    Preencher taxas da classe Registros V13
    Preencher os prestadores da classe FIF/FIDC     #Preencher os prestadores da classe
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse V13
    Preencher perfil da subclasse FIDC V13
    Preencher taxas Subclasse V13
    Preencher valor minimo e movimentacao FIDC
    Cadastrar prestadores da subclasse FIDC
    Validar tela detalhes do fundo
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Validar fundo em analise    FIDC
