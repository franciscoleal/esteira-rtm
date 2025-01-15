*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo FIDC Financeiro

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de Fundo]Registrar fundo do tipo FIDC Financeiro
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIDC    FIDC    Monoclasse
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos Registro FIDC V13
    Concluir o fundo casca
    Preencher os dados cadastrais da classe de FIDC    Teste fiagro    Teste fiagro
    Preencher perfil da classe com argumentos completo FIDC Registro V13    FIDC    FIDC    Financeiro    vazia    vazia
    Alterar o preenchimento das taxas da classe para subclasse
    Preencher os prestadores da classe FIF/FIDC
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse V13
    Preencher perfil da subclasse FIDC V13
    Preencher taxas da classe Registros FIDC V13
    Preencher valor minimo e movimentacao FIDC
    Cadastrar prestadores da subclasse FIDC
    Validar tela detalhes do fundo
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar por CNPJ V13       ${CNPJ_VALIDO}
    Validar fundo em analise    FIDC