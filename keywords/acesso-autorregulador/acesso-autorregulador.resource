*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Alterar Acesso para Autorregulador
    Sleep    4s
    GlobalKeywords.Wait And Click    //div[@class='user-container MuiBox-root css-1mv69se']
    GlobalKeywords.Wait And Click    //li[contains(.,'Meus acessos')]
    GlobalKeywords.Visivel    (//button[contains(.,'Selecionar')])[1]    30
    SeleniumLibrary.Scroll Element Into View    (//button[contains(.,'Selecionar')])[1]
    GlobalKeywords.Wait And Click    (//button[contains(.,'Selecionar')])[1]
    GlobalKeywords.Visivel    //p[contains(.,'Autorregulador')]