*** Settings ***
Documentation      Essa automação valida Preenchimento razão social ok, nome comercial ok (CRÉDITO PRIVADO/Percentual permitido em Crédito Privado)

Resource           ../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test056] Validar Preenchimento razão social ok, nome comercial ok (CRÉDITO PRIVADO/Percentual permitido em Crédito Privado)
    [Tags]    rascunho
    Acessar o HUB    vimerson.miura@vericode.com.br
    Selecionar acesso para Administrador    ITAU
    Criar fundo casca valido completo com subclasse credito privado percent credito privado
    Validar fundo sem inconsistencia    CredPriv_PercentCredPriv
    
