*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo FIF Renda Fixa

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de Fundo]Registrar fundo do tipo FIF Renda Fixa
    Acessar o HUB    ${EMAIL}
    Selecionar acesso    ITAU UNIBANCO SA
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    Renda Fixa    FIF    Monoclasse 
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe Analise
    Preencher perfil da classe Analise V13            #BUG em campo Foco de Atuação - o mesmo informa para preencher, mas o mesmo esta bloqueado em cinza em 28.08.2024
    Preencher as taxas de administracao da classe V13
    Preencher as taxas de gestao da classe
    Preencher as taxas de custodia da classe
    Preencher as taxas de distribuicao da classe
    Preencher as taxas de performance da classe V13
    Preencher as taxas de entrada e saida da V13
    Preencher as taxas de consultor da classe
    Preencher os prestadores da classe FIF/FIDC
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse V13
    Preencher perfil da subclasse FIF V13
    Preencher taxas Subclasse V13
    Preencher valor minimo e movimentacao
    Cadastrar prestadores da subclasse
    Validar tela detalhes do fundo
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Validar fundo em analise    FIFRendaFixa
