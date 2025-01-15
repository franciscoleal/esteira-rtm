*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Sem taxas de Performance SubClasse
    SeleniumLibrary.Press Keys    None    Page Down    3x
    SeleniumLibrary.Scroll Element Into View    //button[contains(.,'Próximo')]
    Sleep    4s
    SeleniumLibrary.Click Element    locator=//button[contains(.,'Próximo')]