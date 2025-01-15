*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Preencher as taxas de Gestao da SubClasse
    Sleep    5s
    SeleniumLibrary.Scroll Element Into View    //p[contains(.,'Gestão')]
    Commons.Wait And Click    //p[contains(.,'Gestão')]
    IF    "${TAXACOMPOSICAOGLOBAL}"=="Selecionar-Todos" or "${TAXACOMPOSICAOGLOBAL}"=="Administracao-Gestao" or "${TAXACOMPOSICAOGLOBAL}"=="Gestao-Distribuicao"
        Set Global Variable    ${TAXACOMPOSICAOGLOBAL}
        Commons.Visivel    //p[contains(.,'ESTA TAXA FOI INCLUÍDA NA TAXA GLOBAL?')]
        SeleniumLibrary.Scroll Element Into View    //div[contains(@aria-labelledby,'cobraTaxaGestao')]
        Commons.Combo    //div[contains(@aria-labelledby,'cobraTaxaGestao')]    //li[contains(.,'Não')]
        Sleep    2s
        SeleniumLibrary.Scroll Element Into View    //button[contains(.,'Próximo')]
        SeleniumLibrary.Click Element    locator=//button[contains(.,'Próximo')]  
        
    ELSE
        SeleniumLibrary.Press Keys    None    HOME
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
        Commons.Wait And Input    //input[contains(@name,'taxaMaximaGestao')]    100    # maximo de 100%
        Commons.Delay dinamico    //button[contains(.,'Próximo')]    30
        SeleniumLibrary.Scroll Element Into View    //button[contains(.,'Próximo')]
        SeleniumLibrary.Click Element    //button[contains(.,'Próximo')]
    END

    # Campo [Taxa Máxima Gestão] deve ser maior que zero e maior ou igual ao campo [Valor Taxa Gestão].