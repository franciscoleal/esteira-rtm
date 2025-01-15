*** Settings ***
Documentation      Essa automação valida Preenchimento razão social ok, nome comercial ok (SIMPLES/Tipo ANBIMA)

Resource           ../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test075] Validar Preenchimento razão social ok, nome comercial ok (SIMPLES/Tipo ANBIMA)
    [Tags]    rascunho
    Acessar o HUB    vimerson.miura@vericode.com.br
    Selecionar acesso para Administrador    ITAU
    Criar fundo casca valido completo com subclasse 
    Validar fundo sem inconsistencia    Simples_TipoAnbima
    
