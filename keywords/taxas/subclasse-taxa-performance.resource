*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Preencher as taxas de Performance SubClasse
    Commons.Combo    //div[contains(@aria-labelledby,'cobraTaxaPerformance')]    //li[contains(.,'Sim')]
    Commons.Combo    //div[contains(@aria-labelledby,'perfilTaxaPerformance')]    //li[contains(.,'Fixa')]
    Commons.Combo    //div[contains(@aria-labelledby,'periodicidadeTaxaPerformance')]    //li[contains(.,'Anual')]
    Commons.Wait And Input    //input[contains(@name,'informacoesAdicionaisTaxaPerformance')]    teste
    Commons.Combo    //div[@aria-labelledby='taxaCobradaPelo']    //li[contains(.,'Gestor')]
    Sleep    3s
    Commons.Wait And Input    //input[@name='indicesReferenciaTaxaPerfomance.0.percentual']    2    
    Commons.Wait And Input    //input[contains(@name,'indicesReferenciaTaxaPerfomance.0.percentualIndiceReferencia')]    2
    Sleep    2s
    #Commons.Combo    //div[contains(@aria-labelledby,'indicesReferenciaTaxaPerfomance.0.indiceReferencia')]    //li[contains(.,'EURO')]
    Commons.Wait And Click    //div[contains(@aria-labelledby,'indicesReferenciaTaxaPerfomance.0.indiceReferencia')]
    SeleniumLibrary.Scroll Element Into View    //li[contains(.,'EURO')]
    SeleniumLibrary.Click Element    //li[contains(.,'EURO')]
    Sleep    3s
    Commons.Wait And Input    //input[@name='indicesReferenciaTaxaPerfomance.0.valorTaxaFixa']    2
    Wait Until Keyword Succeeds    5X    5s    SeleniumLibrary.Scroll Element Into View    //button[contains(.,'Próximo')]
    Commons.Wait And Click    //button[contains(.,'Próximo')]   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    