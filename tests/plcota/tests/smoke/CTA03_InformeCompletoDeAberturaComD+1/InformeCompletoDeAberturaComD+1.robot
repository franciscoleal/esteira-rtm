*** Settings ***
Documentation    Essa automação cadastra um Informe completo de abertura com D+1

Resource    ../../../../../main.robot

Test Setup         Navegador-config.Abrir o navegador
Test Teardown      Navegador-config.Fechar o navegador

*** Test Cases ***

[PL/Cota] Informe completo de abertura em D+1
    Login.Acessar o HUB    USER=${EMAIL}    ENV=${LINK_HUB_UAT}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Cadastro-Completo-PLCota.Preencher cadastro completo de PLCota    C0000055700    +1
    Validar-Exigencia-180-dias.Validar exigencia de data dentro dos 180 dias
    ScreenCapLibrary.Take Screenshot    evidencia_completo_aberturaD+1.jpg