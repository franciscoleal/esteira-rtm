*** Settings ***
Documentation      Essa automação valida campos atrelados na edição de um fundo em rascunho - Unidade da taxa de entrada

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test035]Validar campos atrelados na edição de um fundo em rascunho - Unidade da taxa de entrada
    [Tags]    rascunho
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Criar fundo casca valido completo com subclasse V13
    Main Menu
    #Clicar na opção fundos    Rascunho
    #Filtrar fundo por numero da solicitacao
    #Editar fundo pesquisado no rascunho
    Abrir edicao da subclasse em rascunho
    Ir e validar campos da aba taxa    Entrada e saída
    Habilitar campo    Entrada
