*** Settings ***

Resource    ../../main.robot

*** Keywords ***
Dado que envio um arquivo de exceção
    [Documentation]
    ...    Multimerado Investimento no Exterior
    ...    Periodo=Diario
    Login.Acessar o HUB    ${EMAIL}    ${LINK_HUB_UAT}
    Profile.Alterar o perfil    Perfil=Administrador    Instituicao=ITAU    menu=1
    Commons.Acessar o PLCota
    Upload-Plcota.Upload de informe diario
    Commons.Get File Informe Number

Quando troco para Autorregulador e aprovo
    Profile.Alterar o perfil    Perfil=Autorregulador    Instituicao=ANBIMA    menu=1
    Commons.Acessar o PLCota
    Commons.Filtrar informe por numero envio de arquivo
    Commons.Acessar informe
    Commons.Aprovar Exceção

Então o informe foi enviado com sucesso
    Profile.Alterar o perfil    Perfil=Administrador    Instituicao=ITAU    menu=1
    Commons.Acessar o PLCota
    Commons.Filtrar informe por numero envio de arquivo
    Commons.Acessar informe
    



