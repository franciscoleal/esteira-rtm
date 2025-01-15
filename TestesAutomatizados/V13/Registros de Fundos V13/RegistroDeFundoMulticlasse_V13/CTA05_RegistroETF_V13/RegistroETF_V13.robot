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
    Preencher os dados cadastrais    ETF    ETF
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Adicionar multiplas classes sem subclasse V13   2    ETF
    Validar tela detalhes do fundo
    Validar classes criadas    2    ETF
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Validar fundo em analise    ETFRendaFixa
