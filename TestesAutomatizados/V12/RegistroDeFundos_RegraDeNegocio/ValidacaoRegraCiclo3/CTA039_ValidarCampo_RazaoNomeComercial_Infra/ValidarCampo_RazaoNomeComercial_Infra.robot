*** Settings ***
Documentation      Essa automação validar Preenchimento razão social ok, nome comercial ok (INFRAESTRUTURA/Infraestrutura)

Resource           ../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test039] Validar Preenchimento razão social ok, nome comercial ok (INFRAESTRUTURA/Infraestrutura)    
    [Tags]    rascunho
    Acessar o HUB    vimerson.miura@vericode.com.br
    Selecionar acesso para Administrador    ITAU
    Criar fundo casca valido completo com subclasse infraestrutura
    Validar fundo sem inconsistencia    Infraestrutura
    
