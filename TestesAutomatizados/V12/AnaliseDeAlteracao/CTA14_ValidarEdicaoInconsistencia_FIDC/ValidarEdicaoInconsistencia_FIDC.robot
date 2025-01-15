*** Settings ***
Documentation      Essa automação valida edição dos campos marcados como inconsistência - Instituição - FIDC

Resource           ../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test14]Validar edição dos campos marcados como inconsistência - Instituição - FIDC
    [Tags]    inconsistencia
    Acessar o HUB    joao.marques-ext@anbima.com.br
    Criar fundo casca valido completo com subclasse FIDC
    Enviar para analise anbima
    Get Register Number
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Acessar analise de cadastro
    Validar apontamento de inconsistencia    FIDC
    Editar campo marcado com inconsistencia
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Acessar analise de cadastro
    Validar alteração de inconsistencia    FIDC