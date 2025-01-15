*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Desabilitar preenchimento das Taxas da Classe
    [Documentation]    Desabilita o preenchimento de taxas na classe, para que possa ser preenchido na subclasse
    Commons.Visivel    //span[contains(.,'Cadastrar taxas')]
    Set Variable    ${CONT}    0
    FOR    ${CONT}    IN RANGE    8
        Sleep    1s
        SeleniumLibrary.Scroll Element Into View    //span[contains(.,'Cadastrar taxas')]
        Commons.Wait And Click    //*[@id="__next"]/main/div[2]//div/p[2]/span[2]/span[1]
        Sleep    1s
        SeleniumLibrary.Scroll Element Into View    //button[contains(.,'Próximo')]
        Commons.Wait And Click    //button[contains(.,'Próximo')]      
    END