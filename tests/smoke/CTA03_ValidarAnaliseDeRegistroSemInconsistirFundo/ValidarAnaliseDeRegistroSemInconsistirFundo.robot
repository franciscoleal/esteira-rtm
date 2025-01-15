*** Settings ***
Documentation      Essa automação valida Analise de Registro sem inconsistir fundo

Resource    ../../../main.robot

Test Setup         Navegador-Config.Abrir o navegador
Test Teardown      Navegador-Config.Fechar o navegador

*** Test Cases ***

[Teste07]Validar Analise de Registro sem inconsistir fundo
    Login.Acessar o HUB    ${EMAIL}    ${LINK_HUB_UAT}
    Validar perfil    Administrador
    Criar fundo casca valido completo com subclasse FIF V13
    Enviar para analise anbima v13
    Get Register Number
    Profile.Alterar o perfil    Autorregulador    ANBIMA    1
    Clicar na opção fundos V13
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Acessar analise de cadastro
    Aprovar registro
    Filtrar fundo por numero da solicitacao no perfil autorregulador
    # Alterar o perfil    Administrador    ITAU UNIBANCO SA    1
    Filtrar registrados
    Clicar em Alteracao
    Pause Execution


[Teste07]Validar Analise de Registro sem inconsistir fundo
    Login.Acessar o HUB    ${EMAIL}    ${LINK_HUB_UAT}
    Profile.Alterar o perfil    Autorregulador    ANBIMA    1
    Fundo-Casca-Completo-SubClasse.Criar Fundo Casca Válido completo com SubClasse

    Validar-Detalhes-Fundo.Validar tela detalhes do fundo