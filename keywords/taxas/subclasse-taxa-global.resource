*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Preencher as taxas Globais da SubClasse   
    Sleep    2s
    Commons.Wait And Click    //p[contains(.,'Global')]
    Commons.Visivel    //div[@aria-labelledby='cobraTaxaGlobal']    40s
    SeleniumLibrary.Scroll Element Into View    //div[@aria-labelledby='cobraTaxaGlobal']
    Commons.Combo    //div[@aria-labelledby='cobraTaxaGlobal']    //li[contains(.,'Sim')]

    # Commons.Combo    //div[contains(@aria-labelledby,'cobraTaxaAdministracao')]    //li[contains(.,'Sim')]
    IF    "${dados['SubClasse']['TaxasDaSubClasse']['TAXA_COMPOSICAO_GLOBAL']}" == "Administracao-Gestao" 
        Sleep    2s
        Commons.Wait And Click    //div[@aria-labelledby='taxaComposicaoGlobal']
        Commons.Visivel    //p[contains(.,'Taxa de administração')]    20s
        Commons.Wait And Click     //li[contains(.,'Taxa de administração')]   
        Commons.Wait And Click     //li[contains(.,'Taxa de gestão')]   
        Set Global Variable    ${TAXACOMPOSICAOGLOBAL}    Administracao-Gestao

    ELSE IF    "${dados['SubClasse']['TaxasDaSubClasse']['TAXA_COMPOSICAO_GLOBAL']}" == "Administracao-Distribuicao" 
        Sleep    2s
        Commons.Wait And Click    //div[@aria-labelledby='taxaComposicaoGlobal'] 
        Commons.Visivel    //p[contains(.,'Taxa de administração')]    20s  
        Commons.Wait And Click     //li[contains(.,'Taxa de administração')]
        Commons.Wait And Click     //li[contains(.,'Taxa de distribuição')]
        Set Global Variable    ${TAXACOMPOSICAOGLOBAL}    Administracao-Distribuicao

    ELSE IF    "${dados['SubClasse']['TaxasDaSubClasse']['TAXA_COMPOSICAO_GLOBAL']}" == "Gestao-Distribuicao"
        Sleep    2s
        Commons.Wait And Click    //div[@aria-labelledby='taxaComposicaoGlobal']
        Commons.Visivel    //p[contains(.,'Taxa de gestão')]    20s
        Commons.Wait And Click     //li[contains(.,'Taxa de gestão')]
        Commons.Wait And Click     //li[contains(.,'Taxa de distribuição')]
        Set Global Variable    ${TAXACOMPOSICAOGLOBAL}    Gestao-Distribuicao

    ELSE IF    "${dados['SubClasse']['TaxasDaSubClasse']['TAXA_COMPOSICAO_GLOBAL']}" == "Selecionar-Todos"
        Sleep    2s
        Commons.Wait And Click    //div[@aria-labelledby='taxaComposicaoGlobal']
        Commons.Visivel    //p[contains(.,'Selecionar todos')]    20s
        Commons.Wait And Click    //p[contains(.,'Selecionar todos')]
        Set Global Variable    ${TAXACOMPOSICAOGLOBAL}    Selecionar-Todos 

    ELSE IF    "${dados['SubClasse']['TaxasDaSubClasse']['TAXA_COMPOSICAO_GLOBAL']}" == "Administracao"
        Sleep    2s
        Commons.Wait And Click    //div[@aria-labelledby='taxaComposicaoGlobal']
        Commons.Visivel    //p[contains(.,'Taxa de administração')]    20s
        Commons.Wait And Click     //li[contains(.,'Taxa de administração')]
        Set Global Variable    ${TAXACOMPOSICAOGLOBAL}    Administracao 
    END

    Sleep    2s
    SeleniumLibrary.Press Keys    None    ESC
    Sleep    2s
    Commons.Combo    //div[@aria-labelledby='perfilTaxaGlobal']    //li[contains(.,'Fixa')]
    Commons.Visivel    //div[@aria-labelledby='unidadeTaxaGlobal']    
    Commons.Combo    //div[@aria-labelledby='unidadeTaxaGlobal']    //li[contains(.,'Valor')]
    Sleep    3s
    SeleniumLibrary.Press Keys    None    END
    Commons.Wait And Input    //input[@name='valorTaxaGlobal']    150
    SeleniumLibrary.Scroll Element Into View    //input[@name='informacoesAdicionaisTaxaGlobal']
    Commons.Wait And Input    //input[@name='informacoesAdicionaisTaxaGlobal']    teste
    Commons.Combo    //div[@aria-labelledby='unidadeTaxaGlobalMaxima']    //li[contains(.,'Valor')]
    Commons.Wait And Input    //input[@name='taxaMaximaGlobal']    150    
    Commons.Delay dinamico    //button[contains(.,'Próximo')]    30
    SeleniumLibrary.Click Element    locator=//button[contains(.,'Próximo')]