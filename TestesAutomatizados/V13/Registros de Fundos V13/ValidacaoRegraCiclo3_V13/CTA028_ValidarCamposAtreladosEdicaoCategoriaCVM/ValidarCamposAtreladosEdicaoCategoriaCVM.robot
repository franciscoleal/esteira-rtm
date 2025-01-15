*** Settings ***
Documentation      Essa automação valida campos atrelados na edição de um fundo em rascunho - Categoria CVM

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Test028]Validar campos atrelados na edição de um fundo em rascunho - Categoria CVM
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Criar fundo casca valido completo com subclasse FIF V13
    
    
    #Clicar na opção fundos
    #Filtrar por CNPJ V13       75.891.206/0001-58    #${CNPJ_VALIDO}
    #Clicar por numero da solicitacao de Registro de fundo
    #Seguir com preenchimento
    
    Editar campos categoria CVM    Evidencia_Campos_Categoria_CVM
    Validar campos habilitados e alterados    Evidencia_Campos_Categoria_CVM_Alterados