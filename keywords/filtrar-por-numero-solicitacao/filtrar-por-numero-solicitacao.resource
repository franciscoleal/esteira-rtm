*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Filtrar por Número de Solicitação
    [Arguments]    ${TIPO}=
    IF    "${TIPO}" == "Offshore"
        Commons.Wait And Input    //input[contains(@name,'search')]    ${NUM_SOLICITACAO}
        Sleep    5s 
        Commons.Wait And Press Keys    //input[contains(@name,'search')]    ENTER
        Sleep    4s
    ELSE
        Commons.Wait And Input    //input[contains(@name,'search')]    ${NUM_SOLICITACAO}
        SeleniumLibrary.Press Keys    //input[contains(@name,'search')]    ENTER
        Sleep    2s
        Commons.Visivel    //td[contains(.,'${CNPJ_VALIDO}')]
    END