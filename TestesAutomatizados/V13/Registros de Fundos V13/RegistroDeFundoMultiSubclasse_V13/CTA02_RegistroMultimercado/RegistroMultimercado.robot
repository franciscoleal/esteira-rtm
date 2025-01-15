*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo Fundos de Multimercado com multiplas subclasses

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de Fundo]Registrar fundo do tipo Fundos de Multimercado com multiplas subclasses
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    Multimercado    FIF    Multiclasses 
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Adicionar multiplas subclasses no registro Multimercado V13   2
    Validar tela detalhes do fundo
    Validar subclases criadas V13    Multimercado
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Validar fundo em analise    Multimercado