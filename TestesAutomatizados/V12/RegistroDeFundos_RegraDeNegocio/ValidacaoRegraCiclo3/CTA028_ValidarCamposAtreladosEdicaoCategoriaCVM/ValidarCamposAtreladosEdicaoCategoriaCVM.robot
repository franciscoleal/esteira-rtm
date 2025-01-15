*** Settings ***
Documentation      Essa automação valida campos atrelados na edição de um fundo em rascunho - Categoria CVM

Resource           ../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Test028]Validar campos atrelados na edição de um fundo em rascunho - Categoria CVM
    Acessar o HUB    vimerson.miura@vericode.com.br
    Selecionar acesso para Administrador    ITAU
    Criar fundo casca valido completo com subclasse
    Editar campos categoria CVM    Evidencia_Campos_Categoria_CVM
    Validar campos habilitados e alterados    Evidencia_Campos_Categoria_CVM_Alterados