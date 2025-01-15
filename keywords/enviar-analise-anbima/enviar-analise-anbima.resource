*** Settings ***
Resource            ../../main.robot     


*** Keywords ***
Enviar para Análise Anbima
    Sleep    7s
    Wait Until Keyword Succeeds    5x    3s    Commons.Visivel    //button[contains(.,'Enviar para análise Anbima')]
    Wait Until Keyword Succeeds    5x    3s    Commons.Wait And Click    //button[contains(.,'Enviar para análise Anbima')]
    Commons.Wait And Click    //button[contains(.,'Sim, finalizar')]
    Sleep    4s
    ScreenCapLibrary.Take Screenshot
    Sleep    10s