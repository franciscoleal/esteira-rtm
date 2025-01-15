*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Sem taxas de Distribuicao da SubClasse
    SeleniumLibrary.Scroll Element Into View    //button[contains(.,'Próximo')]
    Sleep   4s
    SeleniumLibrary.Click Element    //button[contains(.,'Próximo')]