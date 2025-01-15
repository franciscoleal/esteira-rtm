*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo Fundos de ETF com multiplas classes

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de Fundo]Registrar fundo do tipo Fundo de ETF com multiplas classes
    Acessar o HUB    ${EMAIL}
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIDC    FIDC
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos Registro FIDC V13
    Concluir o fundo casca
    Adicionar multiplas classes sem subclasse V13    2    FIDC
    Validar tela detalhes do fundo
    Validar classes criadas    2    FIDC
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Validar fundo em analise    FIDC
