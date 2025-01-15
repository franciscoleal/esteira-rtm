*** Settings ***
Documentation      Essa automação valida campos atrelados na edição de um fundo em rascunho - Cobra taxa de performance

Resource           ../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Test030]Validar campos atrelados na edição de um fundo em rascunho - Cobra taxa de performance
    Acessar o HUB    vimerson.miura@vericode.com.br
    Selecionar acesso para Administrador    ITAU
    Criar fundo casca valido completo com subclasse FIDC
    Editar campo taxa performance Classe Sim    Evidencia_Edicao_Taxa_Performance_Classe_Sim
    Editar campo taxa performance Classe Nao    Evidencia_Edicao_Taxa_Performance_Classe_Nao
    Editar campo taxa performance Subclasse Nao    Evidencia_Edicao_Taxa_Performance_SubClasse_Nao