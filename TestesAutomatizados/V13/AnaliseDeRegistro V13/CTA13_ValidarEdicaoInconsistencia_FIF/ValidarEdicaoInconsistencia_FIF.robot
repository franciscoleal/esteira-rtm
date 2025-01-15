*** Settings ***
Documentation      Essa automação valida edição dos campos marcados como inconsistência - Instituição - FIF

Resource           ../../../Keywords/Keywords.robot
Resource    ../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test13]Validar edição dos campos marcados como inconsistência - Instituição - FIF
    [Tags]    inconsistencia
    Acessar o HUB     vimerson.miura@vericode.com.br
    Selecionar acesso    Administrador
    Criar fundo casca valido completo com subclasse V13
    Enviar para analise anbima
    ##Get Register Number
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
    Validar alteração de inconsistencia    FIF
    Alterar acesso para Administrador