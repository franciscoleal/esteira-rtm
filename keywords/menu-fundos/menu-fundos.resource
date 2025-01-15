*** Settings ***

Resource    ../../main.robot


*** Keywords ***
Clicar no Menu Fundos
    [Documentation]    Se não for informado a seção ele vai automaticamente para Solicitações
    [Arguments]    ${SECTION}=Solicitações
    Wait Until Keyword Succeeds    5x    3s    Commons.Visivel    //a[contains(.,'Fundos')]
    Sleep    7s
    SeleniumLibrary.Click Element     locator=//a[contains(.,'Fundos')]
    Sleep    5s
    Commons.Wait And Click    //button[contains(.,'${SECTION}')]
    ScreenCapLibrary.Take Screenshot