*** Settings ***
Documentation      Essa automação validar Preenchimento razão social ok, nome comercial ok (CURTO PRAZO/Sufixo)

Resource           ../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test048] Validar Preenchimento razão social ok, nome comercial ok (CURTO PRAZO/Sufixo)
    [Tags]    rascunho
    Acessar o HUB    vimerson.miura@vericode.com.br
    Selecionar acesso para Administrador    ITAU
    Criar fundo casca valido completo com subclasse curto prazo
    Validar fundo sem inconsistencia    CurtoPrazo_Sufixo
    
