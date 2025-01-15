*** Settings ***
Resource    ../../main.robot    

*** Keywords ***
Sem taxas Globais da SubClasse
    Sleep    4s
    SeleniumLibrary.Press Keys    None    Page Up    3x
    SeleniumLibrary.Scroll Element Into View    //button[contains(.,'Próximo')]
    Commons.Visivel    //button[contains(.,'Próximo')]     
    SeleniumLibrary.Click Element    locator=//button[contains(.,'Próximo')]