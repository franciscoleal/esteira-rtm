*** Settings ***
Documentation      Essa automação valida marcação de inconsistências em fundos enviados na Alteração - ANBIMA - ETF

Resource    ../../../../main.robot

Test Setup         Navegador-Config.Abrir o navegador
Test Teardown      Navegador-Config.Fechar o navegador

*** Test Cases ***

[Test05]Validar marcação de inconsistências em fundos enviados na Alteração - ANBIMA - ETF
    [Tags]    inconsistencia
    Login.Acessar o HUB    ${EMAIL}    ${LINK_HUB_UAT}
    Criar fundo casca valido completo com subclasse ETF
    Enviar para analise anbima
    Get Register Number
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Acessar analise de cadastro
    Aprovar-Registro.Aprovar registro
    Alterar acesso para adm
    Efetuar alteração no fundo aprovado
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtro avançado para alteracao
    Analisar alteracao
    Validar apontamento de inconsistencia    ETF
