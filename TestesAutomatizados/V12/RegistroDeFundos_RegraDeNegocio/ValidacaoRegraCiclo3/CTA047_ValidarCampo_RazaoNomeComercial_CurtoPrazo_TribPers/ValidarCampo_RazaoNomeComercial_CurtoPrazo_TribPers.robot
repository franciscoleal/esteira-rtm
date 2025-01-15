*** Settings ***
Documentation      Essa automação validar Preenchimento razão social ok, nome comercial ok (CURTO PRAZO/Tributação Perseguida)  

Resource           ../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test047] Validar Preenchimento razão social ok, nome comercial ok (CURTO PRAZO/Tributação Perseguida)  
    [Tags]    rascunho
    Acessar o HUB    vimerson.miura@vericode.com.br
    Selecionar acesso para Administrador    ITAU
    Criar fundo casca valido completo com subclasse curto prazo
    Validar fundo sem inconsistencia    CurtoPrazo_TributacaoPerseguida
    
