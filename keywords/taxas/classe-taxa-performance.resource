*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Preencher as taxas de performance da classe
    IF    "${dados['Classe']['TaxasDaClasse']['COBRA-TAXA-PERFORMANCE']}" == "Sim"
        Sleep    1s
        SeleniumLibrary.Press keys    none    HOME
        Sleep    1s
        Commons.Combo    //div[contains(@aria-labelledby,'cobraTaxaPerformance')]    //li[contains(.,'${dados['Classe']['TaxasDaClasse']['COBRA-TAXA-PERFORMANCE']}')]
        Commons.Combo    //div[contains(@aria-labelledby,'perfilTaxaPerformance')]    //li[contains(.,'Fixa')]
        Commons.Combo    //div[contains(@aria-labelledby,'periodicidadeTaxaPerformance')]    //li[contains(.,'Anual')]
        Commons.Wait And Input    //input[contains(@name,'informacoesAdicionaisTaxaPerformance')]    teste
        Commons.Wait And Input    //input[@name='indicesReferenciaTaxaPerfomance.0.percentual']    12,33
        Commons.Wait And Input    //input[@name='indicesReferenciaTaxaPerfomance.0.percentualIndiceReferencia']    12,03   
        Commons.Combo    //div[@aria-labelledby='indicesReferenciaTaxaPerfomance.0.indiceReferencia']    //li[contains(.,'ICO2')]
        Sleep    3s
        Commons.Wait And Input    //input[@name='indicesReferenciaTaxaPerfomance.0.valorTaxaFixa']    22,22
        Commons.Combo    //div[@aria-labelledby='taxaCobradaPelo']    //li[contains(.,'Gestor')]
        Commons.Wait And Click    //button[contains(.,'Próximo')]
    ELSE IF    "${dados['Classe']['TaxasDaClasse']['COBRA-TAXA-PERFORMANCE']}" == "Nao"
        Commons.Combo    //div[contains(@aria-labelledby,'cobraTaxaPerformance')]    //li[contains(.,'${dados['Classe']['TaxasDaClasse']['COBRA-TAXA-PERFORMANCE']}')]
        SeleniumLibrary.Press Keys    None    Page Down    3x
        SeleniumLibrary.Scroll Element Into View    //button[contains(.,'Próximo')]
        SeleniumLibrary.Click Element    locator=//button[contains(.,'Próximo')]
    ELSE IF    "${dados['Classe']['TaxasDaClasse']['DESABILITAR-TAXAS']}" == "Sim"    
        Validar-Taxas-Classe.[Classe]Desabilitar as taxas da classe
    END