*** Settings ***
Documentation       Essa automação realiza o upload de um arquivo de Informe PL/Cota (formato válido)

Resource            ../../../../../main.robot

Test Setup          Navegador-Config.Abrir o navegador
Test Teardown       Navegador-Config.Fechar o navegador


*** Test Cases ***
[Informes Periódicos] [PL/Cota] [Teste28] Upload de um arquivo de Informe PL/Cota (formato válido)
    [Tags]    test16
    Login.Acessar o HUB    ${EMAIL}    ${LINK_HUB_CERT}
    Profile.Alterar o perfil    Perfil=Administrador    Instituicao=ITAU UNIBANCO SA    menu=1
    Commons.Acessar o PLCota
    Keywords.Upload de informe diario    Valido
    Keywords.Validar processamento do informe por arquivo    Possíveis Inconsistências
