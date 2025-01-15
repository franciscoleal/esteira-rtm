*** Settings ***
Resource            ../../../../../main.robot

Test Setup          Navegador-config.Abrir o navegador
Test Teardown       Navegador-config.Fechar o navegador

*** Test Cases ***
[Informes Periódicos] Informes de PL/Cota repetidos com upload de arquivo - CERT
    [Documentation]    Classe/Subclasse diário, hub, fechamento
    Login.Acessar o HUB    USER=${EMAIL}    ENV=${LINK_HUB_CERT}
    Profile.Alterar o perfil    Perfil=Administrador    Instituicao=ITAU    menu=1
    Commons.Acessar o PLCota
    Upload-PLCota.Upload de Informes Repetidos - Diário
    ...    FILE=Valido
    ...    NAME-FILE=template-informes-repetidos.json
    # ...    CLASS-OR-SUBCLASS=C0000000779
    Validar-Processamento.Validar processamento do informe repetido por arquivo    Processado


[Informes Periódicos] Informes de PL/Cota repetidos com upload de arquivo - UAT
    [Documentation]    Classe/Subclasse diário, hub, fechamento
    Login.Acessar o HUB    USER=${EMAIL}    ENV=${LINK_HUB_UAT}
    Profile.Alterar o perfil    Perfil=Administrador    Instituicao=ITAU    menu=1
    Commons.Acessar o PLCota
    Upload-PLCota.Upload de Informes Repetidos - Diário
    ...    FILE=Valido
    ...    NAME-FILE=template-informes-repetidos.json
    # ...    CLASS-OR-SUBCLASS=C0000000779
    Validar-Processamento.Validar processamento do informe repetido por arquivo    Processado