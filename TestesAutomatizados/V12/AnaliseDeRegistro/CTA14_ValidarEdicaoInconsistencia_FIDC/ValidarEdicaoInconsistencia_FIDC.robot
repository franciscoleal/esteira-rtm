*** Settings ***
Documentation      Essa automação valida edição dos campos marcados como inconsistência - Instituição - FIDC

Resource           ../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test14]Validar edição dos campos marcados como inconsistência - Instituição - FIDC
    [Tags]    inconsistencia
    Acessar o HUB    daniele.negoro@vericode.com.br
    Criar fundo casca valido completo com subclasse FIDC
    Enviar para analise anbima
    #Get Register Number
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Acessar analise de cadastro
    Validar apontamento de inconsistencia
    Editar campo marcado com inconsistencia    #Nova keyword
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Acessar analise de cadastro
    Validar alteração de inconsistencia    FIDC
    Alterar acesso para Administrador