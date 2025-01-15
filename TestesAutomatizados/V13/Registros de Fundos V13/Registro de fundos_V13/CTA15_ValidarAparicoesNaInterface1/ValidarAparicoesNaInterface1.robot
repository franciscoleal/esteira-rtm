*** Settings ***
Documentation      Essa automação valida que o registro de fundo criado apareça nas interfaces

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de fundos][Test15]Validar que o registro de fundo criado apareça nas interfaces
    [Tags]    test01    test15
    Acessar o HUB    ${EMAIL}
    Selecionar acesso    Administrador
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIDC    FIDC    Monoclasse
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe fidc
    Preencher perfil da classe com argumentos completo FIDC V13   FIDC    FIDC    FIDC Outros    Indexados    Indices
    Preencher taxas da classe Registros V13
    Preencher os prestadores da classe FIF/FIDC     #Preencher os prestadores da classe
    Concluir classe sem subclasse
    Preencher perfil complementar FIDC V13
    Preencher valor minimo e movimentacao FIDC
    Cadastrar prestadores da subclasse FIDC V13
    Pesquisar fundo no rascunho
    Validar fundo em rascunho na tela rascunho