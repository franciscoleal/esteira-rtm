*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Sem taxas de Entrada e Saida da SubClasse
    SeleniumLibrary.Press Keys    None    END
    SeleniumLibrary.Scroll Element Into View    //button[contains(.,'Próximo')]
    Sleep    3s
    SeleniumLibrary.Click Element    locator=//button[contains(.,'Próximo')]
