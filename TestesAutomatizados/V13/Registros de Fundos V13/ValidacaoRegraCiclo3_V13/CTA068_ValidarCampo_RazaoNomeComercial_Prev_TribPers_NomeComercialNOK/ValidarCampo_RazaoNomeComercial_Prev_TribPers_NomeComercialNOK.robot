*** Settings ***
Documentation      Essa automação valida Preenchimento razão social ok, nome comercial não ok (PREVIDÊNCIA/Tributação Perseguida)

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test068] Validar Preenchimento razão social ok, nome comercial não ok (PREVIDÊNCIA/Tributação Perseguida)
    [Tags]    rascunho
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Criar fundo casca valido completo com subclasse previdencia tributacao perseguida V13 nome comercial nao ok
    Validar fundo com inconsistencia    NomeComercialNOK
    
