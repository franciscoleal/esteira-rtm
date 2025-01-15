*** Settings ***
Documentation      Essa automação valida retorno de inconsistência apontada 4x em campos diferentes pela Anbima [Fundo ETF][Casca,Classe e Subclasse]

Resource           ../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test69] Validar retorno de inconsistência apontada 4x em campos diferentes pela Anbima [Fundo ETF][Casca,Classe e Subclasse]
    [Tags]    inconsistencia
    Acessar o HUB    daniele.negoro@vericode.com.br
    Criar fundo casca valido completo com subclasse ETF
    Enviar para analise anbima
    Get Register Number
    Apontar inconsistencia e editar em massa    4
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Acessar analise de cadastro
    Validar alteração de inconsistencia    Edicao4x_ETF