*** Settings ***
Resource      ../../main.robot

*** Keywords ***
Preencher as taxas de custodia da classe
    Commons.Combo    //div[contains(@aria-labelledby,'cobraTaxaMaximaCustodia')]    //li[contains(.,'Sim')]
    Commons.Combo    //div[contains(@aria-labelledby,'perfilTaxaMaximaCustodia')]    //li[contains(.,'Fixa')]
    Commons.Combo    //div[contains(@aria-labelledby,'unidadeTaxaMaximaCustodia')]    //li[contains(.,'Valor')]
    Commons.Wait And Input    //input[contains(@name,'valorTaxaMaximaCustodia')]    150
    Commons.Wait And Input    //input[contains(@name,'valorPisoTaxaMaximaCustodia')]    1000
    Commons.Wait And Input    //input[contains(@name,'valorFixoTaxaMaximaCustodia')]    100
    Commons.Wait And Input    //input[contains(@name,'informacoesAdicionaisCustodia')]    teste
    ScreenCapLibrary.Take Screenshot
    SeleniumLibrary.Wait Until Page Does Not Contain Element    //p[contains(.,'Os preenchimentos/edições na etapa anterior foram salvos')]    60
    SeleniumLibrary.Click Element    locator=//button[contains(.,'Próximo')]