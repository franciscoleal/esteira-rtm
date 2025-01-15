*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Preencher as taxas de Custodia da SubClasse
    Commons.Combo    //div[contains(@aria-labelledby,'cobraTaxaMaximaCustodia')]    //li[contains(.,'Sim')]
    Commons.Combo    //div[contains(@aria-labelledby,'perfilTaxaMaximaCustodia')]    //li[contains(.,'Fixa')]
    Commons.Combo    //div[contains(@aria-labelledby,'unidadeTaxaMaximaCustodia')]    //li[contains(.,'Valor')]
    Commons.Wait And Input    //input[contains(@name,'valorTaxaMaximaCustodia')]    150
    Commons.Wait And Input    //input[contains(@name,'valorPisoTaxaMaximaCustodia')]    1000
    Commons.Wait And Input    //input[contains(@name,'valorFixoTaxaMaximaCustodia')]    100
    Commons.Wait And Input    //input[contains(@name,'informacoesAdicionaisCustodia')]    teste
    SeleniumLibrary.Scroll Element Into View    //button[contains(.,'Próximo')]
    SeleniumLibrary.Click Element    locator=//button[contains(.,'Próximo')]

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    