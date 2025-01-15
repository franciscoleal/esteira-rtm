*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Preencher as taxas de consultoria especializada da subclasse
    Commons.Combo    //div[contains(@aria-labelledby,'cobraTaxaConsultoria')]    //li[contains(.,'Sim')]
    Commons.Wait And Click    //div[contains(@aria-labelledby,'cobraTaxaConsultoria')]
    SeleniumLibrary.Scroll Element Into View    //li[contains(.,'Sim')]
    SeleniumLibrary.Click Element    //li[contains(.,'Sim')]
    Commons.Combo    //div[contains(@aria-labelledby,'perfilTaxaConsultoria')]    //li[contains(.,'Fixa')]
    Commons.Wait And Click    //div[contains(@aria-labelledby,'unidadeTaxaConsultoria')]
    SeleniumLibrary.Scroll Element Into View    //li[contains(.,'Maior entre % e valor')]
    SeleniumLibrary.Click Element    //li[contains(.,'Maior entre % e valor')]
    Commons.Wait And Input    //input[contains(@name,'valorTaxaConsultoria')]    50
    Commons.Wait And Input    //input[contains(@name,'valorPisoTaxaConsultoria')]    1000   
    Commons.Wait And Input    //input[contains(@name,'informacoesAdicionaisConsultoria')]    teste
    Commons.Combo    //div[contains(@aria-labelledby,'unidadeTaxaMaximaConsultoria')]    //li[contains(.,'Percentual')]
    Commons.Wait And Input    //input[contains(@name,'taxaMaximaConsultoria')]    50
    SeleniumLibrary.Press Keys    None    Page down
    Sleep    5s
    SeleniumLibrary.Wait Until Page Does Not Contain Element    //p[contains(.,'Os preenchimentos/edições na etapa anterior foram salvos')]    60
    SeleniumLibrary.Click Element    locator=//button[contains(.,'Próximo')]