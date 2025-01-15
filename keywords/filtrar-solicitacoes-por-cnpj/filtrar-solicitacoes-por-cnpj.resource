*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Filtrar Solicitações por CNPJ e confirmar status
    [Arguments]    ${STATUS}
    Menu-Fundos.Clicar no Menu Fundos
    ${CNPJ_VALIDO_LIMPO}=    Remove String    ${CNPJ_VALIDO}   /    .    -   
    Commons.Wait And Input    //input[contains(@name,'search')]    ${CNPJ_VALIDO_LIMPO}
    SeleniumLibrary.Press Keys    //input[contains(@name,'search')]    ENTER
    Sleep    2s
    ${fundo}=    Run Keyword And Return Status    Commons.Visivel    //span[contains(.,'${STATUS}')]
    IF    "${fundo}" == "False"
        SeleniumLibrary.Press Keys    //input[contains(@name,'search')]    CTRL+A+DELETE
        Filtrar registrados
    END