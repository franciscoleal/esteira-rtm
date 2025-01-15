*** Settings ***
Documentation      Essa automação valida campos atrelados na edição de um fundo em rascunho - Cobra Taxa de administração

Resource           ../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Test031]Validar campos atrelados na edição de um fundo em rascunho - Cobra Taxa de administração
    Acessar o HUB    vimerson.miura@vericode.com.br
    Selecionar acesso para Administrador    ITAU
    Criar fundo casca valido completo com subclasse FIDC
    Editar campo taxa Administracao Subclasse sim    Evidencia_Edicao_Taxa_Administracao_SubClasse_Sim
    Valida se os campos foram limpos    Evidencia_Edicao_Taxa_Administracao_SubClasse_Nao