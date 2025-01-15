*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Sem taxas de Gestao da SubClasse
    SeleniumLibrary.Press Keys    None    Page Up    3x
    Sleep    3s
    SeleniumLibrary.Scroll Element Into View    //button[contains(.,'Próximo')]
    Commons.Visivel    //button[contains(.,'Próximo')]     
    SeleniumLibrary.Click Element    locator=//button[contains(.,'Próximo')]