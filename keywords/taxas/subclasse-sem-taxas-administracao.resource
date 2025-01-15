*** Settings ***
Resource    ../../main.robot


*** Keywords ***
Sem taxas de Administração da Subclasse
    Sleep    4s
    SeleniumLibrary.Scroll Element Into View    //button[contains(.,'Próximo')]
    Commons.Visivel    //button[contains(.,'Próximo')]     
    Commons.Wait And Click    //button[contains(.,'Próximo')]