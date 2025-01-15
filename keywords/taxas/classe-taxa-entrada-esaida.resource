*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Preencher as taxas de entrada e saida da classe
    Sleep    2s
    Commons.Wait And Click    //div[contains(@aria-labelledby,'unidadeTaxaEntrada')]
    SeleniumLibrary.Scroll Element Into View    //li[contains(.,'Não se aplica')]
    SeleniumLibrary.Click Element    //li[contains(.,'Não se aplica')]
    Sleep    2s
    Commons.Combo    //div[contains(@aria-labelledby,'unidadeTaxaSaida')]    //li[contains(.,'Não se aplica')]
    Wait Until Keyword Succeeds    5X    5s    SeleniumLibrary.Scroll Element Into View    //button[contains(.,'Próximo')]
    SeleniumLibrary.Wait Until Page Does Not Contain Element    //p[contains(.,'Os preenchimentos/edições na etapa anterior foram salvos')]    60
    SeleniumLibrary.Click Element    locator=//button[contains(.,'Próximo')]