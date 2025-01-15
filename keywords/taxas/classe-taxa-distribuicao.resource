*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Preencher as taxas de distribuicao da classe
    Sleep    4s
    Commons.Wait And Click    //p[contains(.,'Distribuição')]
    IF    "${TAXACOMPOSICAOGLOBAL}"=="Selecionar-Todos" or "${TAXACOMPOSICAOGLOBAL}"=="Administracao-Distribuicao"
        Commons.Visivel    //p[contains(.,'ESTA TAXA FOI INCLUÍDA NA TAXA GLOBAL?')]
        SeleniumLibrary.Scroll Element Into View    //div[contains(@aria-labelledby,'cobraTaxaMaximaDistribuicao')]
        Commons.Combo    //div[contains(@aria-labelledby,'cobraTaxaMaximaDistribuicao')]    //li[contains(.,'Não')]
        Sleep    2s
        SeleniumLibrary.Click Element    locator=//button[contains(.,'Próximo')] 
    
    ELSE
        Commons.Combo    //div[contains(@aria-labelledby,'cobraTaxaMaximaDistribuicao')]    //li[contains(.,'Sim')]
        Commons.Combo    //div[contains(@aria-labelledby,'perfilTaxaMaximaDistribuicao')]    //li[contains(.,'Fixa')]
        Commons.Combo    //div[contains(@aria-labelledby,'unidadeTaxaMaximaDistribuicao')]    //li[contains(.,'Valor')]
        Commons.Wait And Input    //input[contains(@name,'valorTaxaMaximaDistribuicao')]    150
        Commons.Wait And Input    //input[contains(@name,'valorPisoTaxaMaximaDistribuicao')]    1000
        Commons.Wait And Input    //input[contains(@name,'valorFixoTaxaMaximaDistribuicao')]    0
        Commons.Wait And Input    //input[contains(@name,'informacoesAdicionaisDistribuicao')]    teste
        ScreenCapLibrary.Take Screenshot
        Wait Until Keyword Succeeds    5X    5s    SeleniumLibrary.Scroll Element Into View    //button[contains(.,'Próximo')]
        SeleniumLibrary.Wait Until Page Does Not Contain Element    //p[contains(.,'Os preenchimentos/edições na etapa anterior foram salvos')]    60
        SeleniumLibrary.Click Element    locator=//button[contains(.,'Próximo')]
    END