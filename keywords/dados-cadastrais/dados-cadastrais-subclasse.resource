*** Settings ***
Resource    ../../main.robot 

*** Keywords ***
[SubClasse]Preencher os Dados Cadastrais da SubClasse
    Sleep    4s
    ${NREF}    Get Current Date    result_format=%d/%m - %H%M%S%M
    # SeleniumLibrary.Scroll Element Into View    locator=//div[@tabindex='0'][contains(.,'Selecione')]
    
    # Campo Evento
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'evento')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[@tabindex='0'][contains(.,'Selecione')]    //li[contains(.,'${dados['SubClasse']['DadosCadastrais']['EVENTO']}')]


    # Campo Nome Comercial
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'nomeComercial')]
    Run Keyword If    ${passed}==True    Commons.Wait And Input    //input[contains(@name,'nomeComercial')]    ${dados['SubClasse']['DadosCadastrais']['NOME_COMERCIAL']}${SPACE}${NREF}
    
    Sleep    2s
    Commons.Set Today Date
    Sleep    4s
    # SeleniumLibrary.Wait Until Page Does Not Contain Element    //p[contains(.,'Os preenchimentos/edições na etapa anterior foram salvos')]    60
    SeleniumLibrary.Click Element    locator=//button[contains(.,'Próximo')]