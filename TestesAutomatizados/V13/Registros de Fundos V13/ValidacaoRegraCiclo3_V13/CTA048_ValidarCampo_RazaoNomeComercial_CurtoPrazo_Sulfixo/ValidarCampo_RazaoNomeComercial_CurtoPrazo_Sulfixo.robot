*** Settings ***
Documentation      Essa automação validar Preenchimento razão social ok, nome comercial ok (CURTO PRAZO/Sufixo)

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test048] Validar Preenchimento razão social ok, nome comercial ok (CURTO PRAZO/Sufixo)
    [Tags]    rascunho
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Criar fundo casca valido completo com subclasse curto prazo V13
    Validar fundo sem inconsistencia    CurtoPrazo_Sufixo
    
