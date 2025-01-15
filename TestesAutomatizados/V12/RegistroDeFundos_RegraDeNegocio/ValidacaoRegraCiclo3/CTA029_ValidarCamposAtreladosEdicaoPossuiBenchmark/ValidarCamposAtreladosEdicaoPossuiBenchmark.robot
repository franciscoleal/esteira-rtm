*** Settings ***
Documentation      Essa automação valida campos atrelados na edição de um fundo em rascunho - Possui benchmark

Resource           ../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Test029]Validar campos atrelados na edição de um fundo em rascunho - Possui benchmark
    Acessar o HUB    vimerson.miura@vericode.com.br
    Selecionar acesso para Administrador    ITAU
    Criar fundo casca valido completo com subclasse
    Editar campo Possui Benchmark Sim    Evidencia_Campos_Atrelados
    Editar campo Possui Benchmark Nao    Evidencia_Campos_Atrelados