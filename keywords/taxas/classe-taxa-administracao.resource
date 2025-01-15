*** Settings ***
Resource      ../../main.robot

*** Keywords ***    
Preencher as taxas de administração da classe
    # Sleep    1s
    # SeleniumLibrary.Press Keys    None    HOME
    Sleep    5s
    Commons.Wait And Click    //p[contains(.,'Administração')]

    IF    "${TAXACOMPOSICAOGLOBAL}"=="Selecionar-Todos" or "${TAXACOMPOSICAOGLOBAL}"=="Administracao-Distribuicao" or "${TAXACOMPOSICAOGLOBAL}"=="Administracao-Gestao"
        Set Global Variable    ${TAXACOMPOSICAOGLOBAL}        
        Commons.Visivel    //p[contains(.,'ESTA TAXA FOI INCLUÍDA NA TAXA GLOBAL?')]
        SeleniumLibrary.Scroll Element Into View    //div[contains(@aria-labelledby,'cobraTaxaAdministracao')]
        Commons.Combo    //div[contains(@aria-labelledby,'cobraTaxaAdministracao')]    //li[contains(.,'Não')]
        Sleep    2s
        SeleniumLibrary.Click Element    locator=//button[contains(.,'Próximo')] 

    ELSE
        SeleniumLibrary.Scroll Element Into View    //div[contains(@aria-labelledby,'cobraTaxaAdministracao')]
        Commons.Combo    //div[contains(@aria-labelledby,'cobraTaxaAdministracao')]    //li[contains(.,'Sim')]
        Sleep    2s
        Commons.Combo    //div[contains(@aria-labelledby,'perfilTaxaAdministracao')]    //li[contains(.,'Fixa')]
        Commons.Visivel    //div[@aria-labelledby='unidadeTaxaAdministracao']    
        Commons.Combo    //div[@aria-labelledby='unidadeTaxaAdministracao']    //li[contains(.,'Valor')]
        Sleep    3s
        SeleniumLibrary.Press Keys    None    END
        Commons.Wait And Input    //input[contains(@name,'valorTaxaAdministracao')]    150
        SeleniumLibrary.Scroll Element Into View    //input[contains(@name,'informacoesAdicionaisTaxaAdministracao')]
        Commons.Wait And Input    //input[contains(@name,'informacoesAdicionaisTaxaAdministracao')]    teste
        Commons.Combo    //div[contains(@aria-labelledby,'unidadeTaxaAdministracaoMaxima')]    //li[contains(.,'Valor')]
        Commons.Wait And Input    //input[contains(@name,'taxaMaximaAdministracao')]    150
        SeleniumLibrary.Wait Until Page Does Not Contain Element    //p[contains(.,'Os preenchimentos/edições na etapa anterior foram salvos')]    60
        SeleniumLibrary.Click Element    locator=//button[contains(.,'Próximo')]
    END