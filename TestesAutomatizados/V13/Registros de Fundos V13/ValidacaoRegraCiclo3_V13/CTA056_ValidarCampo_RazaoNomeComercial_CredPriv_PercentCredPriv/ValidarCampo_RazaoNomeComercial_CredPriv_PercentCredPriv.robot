*** Settings ***
Documentation      Essa automação valida Preenchimento razão social ok, nome comercial ok (CRÉDITO PRIVADO/Percentual permitido em Crédito Privado)

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test056] Validar Preenchimento razão social ok, nome comercial ok (CRÉDITO PRIVADO/Percentual permitido em Crédito Privado)
    [Tags]    rascunho
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Criar fundo casca valido completo com subclasse credito privado V13    #percent credito privado
    Validar fundo sem inconsistencia    CredPriv_PercentCredPriv
    
