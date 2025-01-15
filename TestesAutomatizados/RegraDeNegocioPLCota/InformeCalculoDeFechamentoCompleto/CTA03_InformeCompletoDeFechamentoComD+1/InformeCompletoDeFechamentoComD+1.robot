*** Settings ***
Documentation       Essa automação cadastra um informe completo de fechamento com D+1

Resource            ../../../../main.robot


Test Setup          Navegador-Config.Abrir o navegador
Test Teardown       Navegador-Config.Fechar o navegador


*** Test Cases ***
[PL/Cota] Informe completo de fechamento em D+1
    [Tags]    cadplcota
    Login.Acessar o HUB    ${EMAIL}
    Profile.Alterar o perfil    Perfil=Administrador    Instituicao=INSTITUIÇÃO TESTE    menu=1
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Keywords.Preencher cadastro completo de PLCota    S0001163752    +1 
    Keywords.Validar exigencia de data dentro dos 180 dias
    ScreenCapLibrary.Take Screenshot    evidencia_completo_fechamentoD+1.jpg
