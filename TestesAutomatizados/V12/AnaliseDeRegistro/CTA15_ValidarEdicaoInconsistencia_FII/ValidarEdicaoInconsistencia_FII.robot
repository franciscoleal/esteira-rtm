*** Settings ***
Documentation      Essa automação valida edição dos campos marcados como inconsistência - Instituição - FII

Resource           ../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test15]Validar edição dos campos marcados como inconsistência - Instituição - FII
    [Tags]    inconsistencia
    Acessar o HUB    daniele.negoro@vericode.com.br
    Criar fundo casca valido completo com subclasse FII
    Enviar para analise anbima
    Get Register Number
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Acessar analise de cadastro
    Validar apontamento de inconsistencia
    Editar campo marcado com inconsistencia
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Acessar analise de cadastro
    Validar alteração de inconsistencia    FII