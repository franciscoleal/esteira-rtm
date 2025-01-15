*** Settings ***
Resource    ../../main.robot    

*** Variables ***


*** Keywords ***
Validar processamento do informe
    [Arguments]    ${PROCESSAMENTO}
    [Documentation]    A variável "PROCESSAMENTO" tem que ser setada como Processado ou Rejeitado.
    Commons.Get Informe Number
    Commons.Visivel    //button[contains(.,'Filtro avançado')]
    Commons.Wait And Click    //button[contains(.,'Filtro avançado')]
    Commons.Wait And Input    //input[contains(@name,'numeroSolicitacao')]    ${PLC_NUM}
    Sleep    8s
    SeleniumLibrary.Wait Until Element Is Visible    locator=//button[contains(.,'Aplicar')]
    Commons.Wait And Click    //button[contains(.,'Aplicar')]
    ${VALID}    Run Keyword And Return Status    Commons.Visivel    //td[contains(.,'Em processamento')]    5
    WHILE    "${VALID}"=="True"
        Commons.Filtrar informe por numero envio de arquivo
        Sleep    1s
        ${VALID}    Run Keyword And Return Status    Commons.Visivel    //td[contains(.,'Em processamento')]    5
    END
    IF    "${PROCESSAMENTO}"=="Processado"
        Commons.Visivel    //span[contains(.,'Processado')]
        Sleep    2s    
        Commons.Wait And Click    //td[contains(.,'${PLC_NUM}')]            #Commons.Wait And Click    //a[contains(@color,'primary')]    #
        Commons.Wait And Click    //button[contains(.,'Processados')]
        Commons.Visivel    //span[contains(.,'Processado')]
        Sleep    1s 
        ScreenCapLibrary.Take Screenshot    name=evidencia_${PROCESSAMENTO}.jpg
    ELSE
        IF    "${PROCESSAMENTO}"=="Rejeitado"
            Commons.Visivel    //span[contains(.,'Possíveis Inconsistências')]
            Sleep    2s    
            Commons.Wait And Click    //td[contains(.,'${PLC_NUM}')]        #Commons.Wait And Click    //a[contains(@color,'primary')]    #
            Commons.Visivel    //span[contains(.,'Rejeitado')]
            Sleep    1s 
            ScreenCapLibrary.Take Screenshot    name=evidencia_${PROCESSAMENTO}.jpg
        END
    END