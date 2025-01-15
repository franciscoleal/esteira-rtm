*** Settings ***
Documentation      Essa automação valida campos atrelados na edição de um fundo em rascunho - Identificador do prestador de serviço

Resource           ../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Test027]Validar campos atrelados na edição de um fundo em rascunho - Identificador do prestador de serviço
    Acessar o HUB    vimerson.miura@vericode.com.br
    Selecionar acesso para Administrador    ITAU
    Criar fundo casca valido completo com subclasse
    Editar o identificador do prestador de servico fundo casca
    Preencher prestadores 5G    Evidencia_Prestador_Casca_Alterado
    Editar o identificador do prestador de servico da classe
    Preencher os prestadores da classe 5G    Evidencia_Prestador_Classe_Alterado    Rascunho
    Editar o identificador do prestador de servico da subclasse
    Cadastrar prestadores da subclasse 5G    Evidencia_Prestador_Subclasse_Alterado