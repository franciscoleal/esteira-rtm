*** Settings ***
Documentation      Essa automação realiza o upload de arquivos de Informe PL/Cota em massa

Resource           ../../Keywords/Keywords.robot
Resource           ../../../main.robot


Test Setup         Navegador-Config.Abrir o navegador
Test Teardown      Navegador-Config.Fechar o navegador

*** Test Cases ***

[Informes Periódicos] [PL/Cota] Upload de arquivos de Informe PL/Cota em massa
    [Tags]    informes_massa
    Login.Acessar o HUB    ${EMAIL}
    Alterar acesso para autorregulador
    Commons.Acessar o PLCota
    Envio de informe por arquivo em massa    Padrão