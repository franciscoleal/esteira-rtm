*** Settings ***
Documentation      Essa automação valida aprovação de fundo enviados na Alteração - ANBIMA - FIDC

Resource           ../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test08]Validar aprovação de fundo enviados na Alteração - ANBIMA - FIDC
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
    Aprovar registro
    Take Screenshot    Evidencia_AprovacaoAlteracao_FIDC.png