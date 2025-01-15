*** Settings ***
Resource    ../../main.robot

*** Variables ***


*** Keywords ***
Habilitar Taxas na subclasse    
    [Documentation]    Habilita o preenchimento das taxas na subclasse, pois foi desabilitado na classe durante
    ...                o seu preenchimento.
    Commons.Visivel    //span[contains(.,'Cadastrar taxas')]
    SeleniumLibrary.Scroll Element Into View    //span[contains(.,'Cadastrar taxas')]
    Set Variable    ${CONT}    0
    FOR    ${CONT}    IN RANGE    8
        Sleep    1s
        Commons.Wait And Click    //*[@id="__next"]/main/div[2]//div/p[2]/span[2]/span[1]
    END