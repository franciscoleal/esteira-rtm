*** Settings ***
Documentation      Essa automação valida campos atrelados na edição de um fundo em rascunho - Identificador do prestador de serviço

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Test027]Validar campos atrelados na edição de um fundo em rascunho - Identificador do prestador de serviço
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Criar fundo casca valido completo com subclasse FIF V13
    Editar o identificador do prestador de servico fundo casca
    Preencher prestadores 5G    Evidencia_Prestador_Casca_Alterado
    Editar o identificador do prestador de servico da classe
    Preencher os prestadores da classe 5G    Evidencia_Prestador_Classe_Alterado    Rascunho
    Editar o identificador do prestador de servico da subclasse
    Cadastrar prestadores da subclasse 5G    Evidencia_Prestador_Subclasse_Alterado