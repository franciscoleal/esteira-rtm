*** Settings ***
Documentation      Essa automação valida aprovação de fundo enviados na Alteração - ANBIMA - FII

Resource    ../../../../main.robot

Test Setup         Navegador-Config.Abrir o navegador
Test Teardown      Navegador-Config.Fechar o navegador

*** Test Cases ***

[Test09]Validar aprovação de fundo enviados na Alteração - ANBIMA - FII
    [Tags]    inconsistencia
    Login.Acessar o HUB    ${EMAIL}    ${LINK_HUB_UAT}
    Criar fundo casca valido completo com subclasse FII V13
    Enviar para analise anbima
    Get Register Number
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Acessar analise de cadastro
    Aprovar-Registro.Aprovar registro
    ScreenCapLibrary.Take Screenshot    Evidencia_AprovacaoAlteracao_FII.png