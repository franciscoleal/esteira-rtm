*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Preencher as taxas de gestao da classe
    Sleep    4s
    Commons.Wait And Click    //p[contains(.,'Gestão')]
    IF    "${TAXACOMPOSICAOGLOBAL}"=="Selecionar-Todos" or "${TAXACOMPOSICAOGLOBAL}"=="Administracao-Gestao"
        Set Global Variable    ${TAXACOMPOSICAOGLOBAL}
        Skip
        Commons.Visivel    //p[contains(.,'ESTA TAXA FOI INCLUÍDA NA TAXA GLOBAL?')]
        SeleniumLibrary.Scroll Element Into View    //div[contains(@aria-labelledby,'cobraTaxaGestao')]
        Commons.Combo    //div[contains(@aria-labelledby,'cobraTaxaGestao')]    //li[contains(.,'Não')]
        Sleep    2s
        SeleniumLibrary.Click Element    locator=//button[contains(.,'Próximo')]  

    ELSE
        Commons.Combo    //div[contains(@aria-labelledby,'cobraTaxaGestao')]    //li[contains(.,'Sim')]
        Commons.Combo    //div[contains(@aria-labelledby,'perfilTaxaGestao')]    //li[contains(.,'Fixa')]
        Sleep    5s
        #Commons.Combo    //div[contains(@aria-labelledby,'unidadeTaxaGestao')]    //li[contains(.,'Valor')]
        Commons.Wait And Click    //div[contains(@aria-labelledby,'unidadeTaxaGestao')]
        SeleniumLibrary.Scroll Element Into View    //li[contains(.,'Valor')]
        SeleniumLibrary.Click Element    //li[contains(.,'Valor')]
        SeleniumLibrary.Press Keys    None    TAB
        Sleep    3s
        Commons.Wait And Input    //input[contains(@name,'valorTaxaGestao')]    150
        Commons.Wait And Input    //input[contains(@name,'informacoesAdicionaisTaxaGestao')]    teste
        Commons.Combo    //div[contains(@aria-labelledby,'unidadeTaxaMaximaGestao')]    //li[contains(.,'Percentual')]
        Commons.Wait And Input    //input[contains(@name,'taxaMaximaGestao')]    100
        SeleniumLibrary.Click Element    locator=//button[contains(.,'Próximo')]
    END