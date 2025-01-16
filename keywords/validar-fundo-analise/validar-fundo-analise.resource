*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Validar fundo em analise
    [Arguments]    ${TIPO}
    IF    "${TIPO}" == "OffShoreRendaFixa"
        # Commons.Wait And Input    //input[contains(@name,'search')]    ${NUM_SOLICITACAO}
        # Sleep    5s
        # Commons.Wait And Press Keys    //input[contains(@name,'search')]    ENTER
        # Sleep    4s
        ${Status}=    Run Keyword And Return Status    Commons.Visivel    //span[contains(.,'Aguardando análise Anbima')]
        IF    "${Status}" == "False"
            Validar-Fundo-Analise.Validar fundo em analise    OffShoreRendaFixa
        END     
    ELSE
        Sleep    5s
        Commons.Wait And Input    //input[contains(@name,'search')]    ${CNPJ_VALIDO}
        Sleep    5s
        Commons.Wait And Press Keys    //input[contains(@name,'search')]    ENTER
        Sleep    4s
        Commons.Visivel    //span[contains(.,'Aguardando análise Anbima')]    15s    
    END