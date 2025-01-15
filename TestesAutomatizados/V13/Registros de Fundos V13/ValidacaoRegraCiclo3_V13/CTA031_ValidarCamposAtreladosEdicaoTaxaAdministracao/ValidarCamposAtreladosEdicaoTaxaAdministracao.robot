*** Settings ***
Documentation      Essa automação valida campos atrelados na edição de um fundo em rascunho - Cobra Taxa de administração

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Test031]Validar campos atrelados na edição de um fundo em rascunho - Cobra Taxa de administração
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Criar fundo casca valido completo com subclasse FIDC V13
    Editar campo taxa Administracao Subclasse sim    Evidencia_Edicao_Taxa_Administracao_SubClasse_Sim    #subclasse encontra-se bloqueadas
    #Valida se os campos foram limpos    Evidencia_Edicao_Taxa_Administracao_SubClasse_Nao