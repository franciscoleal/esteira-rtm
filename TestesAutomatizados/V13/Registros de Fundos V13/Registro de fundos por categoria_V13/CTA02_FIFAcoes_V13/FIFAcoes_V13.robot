*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo FIF Ações

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de Fundo]Registrar fundo do tipo FIF Acoes
    Acessar o HUB    ${EMAIL}
    Selecionar acesso    ITAU UNIBANCO SA
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIF Ações Indexados    FIF    Monoclasse
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe    Teste BDR Nível 1 Mercado de Acesso IE
    Preencher perfil da classe com argumentos completo V13   Ações    Ações   Ações Livres    ATIVOS    LIVRE
    Preencher taxas da classe Registros V13
    Preencher os prestadores da classe FIF/FIDC       
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse V13
    Preencher perfil da subclasse FIF V13
    Preencher taxas Subclasse V13
    Preencher valor minimo e movimentacao FIF Ações
    Cadastrar prestadores da subclasse
    Validar tela detalhes do fundo
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Validar fundo em analise    FIFAcoes
