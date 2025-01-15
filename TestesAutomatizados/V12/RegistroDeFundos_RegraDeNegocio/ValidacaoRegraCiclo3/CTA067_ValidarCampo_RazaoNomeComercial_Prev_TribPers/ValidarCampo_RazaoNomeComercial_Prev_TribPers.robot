*** Settings ***
Documentation      Essa automação valida Preenchimento razão social ok, nome comercial ok (PREVIDÊNCIA/Tributação Perseguida)

Resource           ../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test067] Validar Preenchimento razão social ok, nome comercial ok (PREVIDÊNCIA/Tributação Perseguida)
    [Tags]    rascunho
    Acessar o HUB    vimerson.miura@vericode.com.br
    Selecionar acesso para Administrador    ITAU
    Criar fundo casca valido completo com subclasse previdencia tributacao perseguida
    Validar fundo sem inconsistencia    Prev_TribPers
    
