*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Sem taxas de Custodia da SubClasse
    SeleniumLibrary.Press Keys    None    Page Down    3x
    Sleep    4s
    SeleniumLibrary.Scroll Element Into View    //button[contains(.,'Próximo')]
    Sleep    4s
    SeleniumLibrary.Click Element    locator=//button[contains(.,'Próximo')]