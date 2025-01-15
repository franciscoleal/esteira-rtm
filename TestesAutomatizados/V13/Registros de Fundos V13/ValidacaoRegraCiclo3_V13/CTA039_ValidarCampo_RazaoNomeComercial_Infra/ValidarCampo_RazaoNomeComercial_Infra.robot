*** Settings ***
Documentation      Essa automação validar Preenchimento razão social ok, nome comercial ok (INFRAESTRUTURA/Infraestrutura)

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test039] Validar Preenchimento razão social ok, nome comercial ok (INFRAESTRUTURA/Infraestrutura)    
    [Tags]    rascunho
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Criar fundo casca valido completo com subclasse infraestrutura V13
    Validar fundo sem inconsistencia    Infraestrutura
    
