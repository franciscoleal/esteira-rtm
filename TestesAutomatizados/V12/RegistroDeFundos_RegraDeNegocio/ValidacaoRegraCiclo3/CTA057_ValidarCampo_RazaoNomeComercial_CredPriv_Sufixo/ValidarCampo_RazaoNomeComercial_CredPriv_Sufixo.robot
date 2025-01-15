*** Settings ***
Documentation      Essa automação valida Preenchimento razão social ok, nome comercial ok (CRÉDITO PRIVADO/Sufixo)

Resource           ../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test057] Validar Preenchimento razão social ok, nome comercial ok (CRÉDITO PRIVADO/Sufixo)
    [Tags]    rascunho
    Acessar o HUB    vimerson.miura@vericode.com.br
    Selecionar acesso para Administrador    ITAU
    Criar fundo casca valido completo com subclasse credito privado
    Validar fundo sem inconsistencia    CredPriv_Sufixo
    
