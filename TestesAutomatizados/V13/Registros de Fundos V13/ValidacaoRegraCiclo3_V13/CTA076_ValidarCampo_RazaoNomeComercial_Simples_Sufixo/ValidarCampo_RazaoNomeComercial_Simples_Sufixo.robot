*** Settings ***
Documentation      Essa automação valida Preenchimento razão social ok, nome comercial ok (SIMPLES/Sufixo)

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test076] Validar Preenchimento razão social ok, nome comercial ok (SIMPLES/Sufixo)
    [Tags]    rascunho
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Criar fundo casca valido completo com subclasse V13
    Validar fundo sem inconsistencia    Simples_Sufixo
    
