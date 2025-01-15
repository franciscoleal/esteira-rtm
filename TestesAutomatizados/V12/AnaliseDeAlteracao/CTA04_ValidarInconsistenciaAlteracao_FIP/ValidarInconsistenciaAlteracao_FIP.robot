*** Settings ***
Documentation      Essa automação valida marcação de inconsistências em fundos enviados na Alteração - ANBIMA - FIP

Resource           ../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test04]Validar marcação de inconsistências em fundos enviados na Alteração - ANBIMA - FIP
    [Tags]    inconsistencia
    Acessar o HUB    joao.marques-ext@anbima.com.br
    Criar fundo casca valido completo com subclasse FIP
    Enviar para analise anbima
    Get Register Number
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Acessar analise de cadastro
    Aprovar registro
    Alterar acesso para adm
    Efetuar alteração no fundo aprovado
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtro avançado para alteracao
    Analisar alteracao
    Validar apontamento de inconsistencia    FIP
