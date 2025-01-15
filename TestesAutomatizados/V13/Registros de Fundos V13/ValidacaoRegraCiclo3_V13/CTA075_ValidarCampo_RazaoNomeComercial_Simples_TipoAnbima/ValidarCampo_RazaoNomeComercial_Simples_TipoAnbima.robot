*** Settings ***
Documentation      Essa automação valida Preenchimento razão social ok, nome comercial ok (SIMPLES/Tipo ANBIMA)

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test075] Validar Preenchimento razão social ok, nome comercial ok (SIMPLES/Tipo ANBIMA)
    [Tags]    rascunho
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Criar fundo casca valido completo com subclasse V13
    Validar fundo sem inconsistencia    Simples_TipoAnbima
    
