*** Settings ***
Documentation      Essa automação valida campos atrelados na edição de um fundo em rascunho - Unidade da taxa de entrada

Resource           ../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test035]Validar campos atrelados na edição de um fundo em rascunho - Unidade da taxa de entrada
    [Tags]    rascunho
    Acessar o HUB    vimerson.miura@vericode.com.br
    Selecionar acesso para Administrador    ITAU
    Criar fundo casca valido completo com subclasse
    Main Menu
    Clicar na opção fundos    Rascunho
    Filtrar fundo por numero da solicitacao
    Editar fundo pesquisado no rascunho
    Abrir edicao da subclasse em rascunho
    Ir e validar campos da aba taxa    Entrada e saída
    Habilitar campo    Entrada
