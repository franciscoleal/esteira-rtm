*** Settings ***
Documentation    Essa automação cadastra um informe completo em D-1 

Resource    ../../../../../main.robot

Test Setup         Navegador-config.Abrir o navegador
Test Teardown      Navegador-config.Fechar o navegador

*** Test Cases ***

[PL/Cota] Informe completo de abertura em D-1
    Login.Acessar o HUB    USER=${EMAIL}    ENV=${LINK_HUB_UAT}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Cadastro-Completo-PLCota.Preencher cadastro completo de PLCota    C0000055700    -1
    Validar-Processamento-Informe.Validar processamento do informe    Processado 