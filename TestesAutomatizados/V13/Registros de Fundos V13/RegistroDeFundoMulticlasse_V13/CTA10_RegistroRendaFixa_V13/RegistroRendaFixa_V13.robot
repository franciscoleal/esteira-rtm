*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo Renda Fixa

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de Fundo]Registrar fundo do tipo Renda Fixa
    Acessar o HUB    ${EMAIL}
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIF Renda Fixa
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Adicionar multiplas classes sem subclasse V13    2    Renda Fixa
    Validar tela detalhes do fundo
    Validar classes criadas    1    Renda Fixa
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Validar fundo em analise    FIFRendaFixa