*** Settings ***

Resource    ../../main.robot

*** Keywords ***
Aprovar Alteração
    Sleep    4s
    Commons.Visivel    //button[contains(.,'Analisar Alteração')]
    SeleniumLibrary.Wait Until Element Is Enabled    //button[contains(.,'Analisar Alteração')]
    Commons.Wait And Click    //button[contains(.,'Analisar Alteração')] 
    Sleep    3s
    Commons.Wait And Click    (//button[contains(.,'Aprovar alteração')])
    Sleep    3s
    Commons.Wait And Click    //button[contains(.,'Confirmar')]
    Sleep    10s
    ScreenCapLibrary.Take Screenshot