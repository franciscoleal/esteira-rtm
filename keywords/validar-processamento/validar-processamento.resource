*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Validar processamento do informe inicial
    Commons.Get Informe Number
    Commons.Visivel    //button[contains(.,'Filtro avançado')]
    Commons.Wait And Click    //button[contains(.,'Filtro avançado')]
    Commons.Wait And Input    //input[contains(@name,'numeroSolicitacao')]    ${PLC_NUM}
    Commons.Wait And Click    //button[contains(.,'Aplicar')]   
    ${VALID}    Run Keyword And Return Status    Commons.Visivel    //td[contains(.,'Em processamento')]    5
    WHILE    "${VALID}"=="True"
        Filtrar informe por numero envio de arquivo
        Sleep    1s
        ${VALID}    Run Keyword And Return Status    Commons.Visivel    //td[contains(.,'Em processamento')]    5
    END
    Commons.Wait And Click    //td[contains(.,'${PLC_NUM}')]
    Sleep    30s
    Commons.Visivel    //span[contains(.,'Processado')]    45s
    Sleep    1s 
    ScreenCapLibrary.Take Screenshot    name=limite medio.png

Validar processamento do informe igual ao mês anterior
    Commons.Get Informe Number
    Commons.Visivel    //button[contains(.,'Filtro avançado')]
    Commons.Wait And Click    //button[contains(.,'Filtro avançado')]
    Commons.Wait And Input    //input[contains(@name,'numeroSolicitacao')]    ${PLC_NUM}
    Commons.Wait And Click    //button[contains(.,'Aplicar')]   

    Sleep    30s    
    Commons.Wait And Click    //td[contains(.,'${PLC_NUM}')]
    Commons.Visivel    //span[contains(.,'Possíveis Inconsistências')]
    Sleep    1s 
    Acessar informe
    Commons.Visivel    //p[contains(.,'Valor da Cota é igual ao do mês anterior.')]
    ScreenCapLibrary.Take Screenshot

Validar processamento do informe de rentabilidade
    [Arguments]    ${PROCESSAMENTO}
    Commons.Get Informe Number    
    Commons.Visivel    //button[contains(.,'Filtro avançado')]
    Commons.Wait And Click    //button[contains(.,'Filtro avançado')]
    Commons.Wait And Input    //input[contains(@name,'numeroSolicitacao')]    ${PLC_NUM}
    Commons.Wait And Click    //button[contains(.,'Aplicar')]
    IF    "${PROCESSAMENTO}"=="Processado"
        # Sleep    60s
        # Commons.Wait And Click    //button[contains(.,'Informes de fundos')]
        # Commons.Wait And Click    //button[contains(.,'Solicitações')]
        # Commons.Visivel    //span[contains(.,'Processado')]
        Sleep    60s    
        Commons.Wait And Click    //td[contains(.,'${PLC_NUM}')]
        Commons.Wait And Click    //button[contains(.,'Processados')]
        Commons.Visivel    (//span[contains(.,'Processado')])[1]
        Sleep    1s 
        ScreenCapLibrary.Take Screenshot
    ELSE IF    "${PROCESSAMENTO}"=="Possiveis Inconsistencias"
        # Sleep    30s
        # Commons.Wait And Click    //button[contains(.,'Informes de fundos')]
        # Commons.Wait And Click    //button[contains(.,'Solicitações')]
        # Commons.Visivel    //span[contains(.,'Possíveis Inconsistências')]
        Sleep    30s    
        Commons.Wait And Click    //td[contains(.,'${PLC_NUM}')]
        Commons.Visivel    //span[contains(.,'Possíveis Inconsistências')]
        Sleep    1s 
        Acessar informe
        # Commons.Visivel    //p[contains(.,'Descasamento de Patrimônio Líquido')]
        Commons.Visivel    //p[contains(.,'Variação da cota fora do limite permitido')]
        ScreenCapLibrary.Take Screenshot
    END
    
    Log    message=Resultado

Acessar informe
    Sleep    1s
    Commons.Wait And Click    //a[contains(@color,'primary')]

Filtrar informe por numero envio de arquivo
    Commons.Wait And Click    //button[contains(.,'Filtro avançado')]
    # SeleniumLibrary.Clear Element Text    //input[contains(@name,'numeroSolicitacao')]
    Commons.Wait And Click    //input[contains(@name,'numeroSolicitacao')]
    SeleniumLibrary.Press Keys    //input[contains(@name,'numeroSolicitacao')]    CTRL+A+DELETE
    Commons.Wait And Input    //input[contains(@name,'numeroSolicitacao')]    ${PLC_NUM}
    Commons.Wait And Click    //button[contains(.,'Aplicar')]
    Sleep    1s


Validar processamento do informe por arquivo
    [Arguments]    ${PROCESSAMENTO}
    [Documentation]    A variável "PROCESSAMENTO" tem que ser setada como Processado ou Rejeitado.
    Commons.Get File Informe Number
    Commons.Visivel    //button[contains(.,'Filtro avançado')]
    Commons.Wait And Click    //button[contains(.,'Filtro avançado')]
    Commons.Wait And Input    //input[contains(@name,'numeroSolicitacao')]    ${PLC_NUM}
    Commons.Wait And Click    //button[contains(.,'Aplicar')]
    IF    "${PROCESSAMENTO}"=="Processado"
        Commons.Visivel    //span[contains(.,'Processado')]
        Sleep    2s    
        Commons.Wait And Click    //td[contains(.,'${PLC_NUM}')]
        Commons.Wait And Click    //button[contains(.,'Processados')]
        Commons.Visivel    //span[contains(.,'Processado')]
    ELSE
        IF    "${PROCESSAMENTO}"=="Possíveis Inconsistências"
            Sleep    30s    
            Commons.Wait And Click    //td[contains(.,'${PLC_NUM}')]
            Commons.Visivel    //span[contains(.,'Possíveis Inconsistências')]
            Sleep    1s 
            Commons.Acessar informe
            # Commons.Visivel    //p[contains(.,'Variação da cota fora do limite permitido')]
            # ScreenCapLibrary.Take Screenshot    name=${LIMIT}.png
        END
    END

Validar processamento do informe repetido por arquivo
    [Arguments]    ${PROCESSAMENTO}
    Commons.Get File Informe Number
    Commons.Visivel    //button[contains(.,'Filtro avançado')]
    Commons.Wait And Click    //button[contains(.,'Filtro avançado')]
    Commons.Wait And Input    //input[contains(@name,'numeroSolicitacao')]    ${PLC_NUM}
    Commons.Wait And Click    //button[contains(.,'Aplicar')]
    Sleep    3s
    ${VALID}    Run Keyword And Return Status    Commons.Visivel    //td[contains(.,'Em processamento')]    5
    WHILE    "${VALID}"=="True"
        Commons.Filtrar informe por numero envio de arquivo
        Sleep    1s
        ${VALID}    Run Keyword And Return Status    Commons.Visivel    //td[contains(.,'Em processamento')]    5
    END 
    IF    "${PROCESSAMENTO}"=="Processado"
        GlobalKeywords.Visivel    //span[contains(.,'Processado')]
        Sleep    2s    
        GlobalKeywords.Wait And Click    //td[contains(.,'${PLC_NUM}')]
        GlobalKeywords.Wait And Click    //button[contains(.,'Processados')]
        GlobalKeywords.Visivel    //span[contains(.,'Processado')]
    ELSE IF    "${PROCESSAMENTO}"=="Possíveis Inconsistências"
        GlobalKeywords.Visivel    //span[contains(.,'Possíveis Inconsistências')]
        Sleep    2s    
        GlobalKeywords.Wait And Click    //td[contains(.,'${PLC_NUM}')]
        GlobalKeywords.Visivel    //span[contains(.,'Possíveis Inconsistências')]
        Sleep    1s
        Commons.Wait And Click    //button[contains(.,'Filtro avançado')]
        ${dados} =    Load Json From File    ${EXECDIR}${/}py-robot-cvm175-rtm${/}keywords${/}upload-plcota${/}templates${/}${NAME-FILE}
        ${segunda_data} =    Get From Dictionary    ${dados}[1]    data_competencia
        ${segunda_data} =	Convert Date    ${segunda_data}    date_format=%Y-%m-%d    result_format=%d/%m/%Y
        Commons.Wait And Click    //input[contains(@name,'periodoDataCompetenciaInicio')]    
        Sleep    2s
        SeleniumLibrary.Press Keys    None     ${segunda_data}   
        Commons.Wait And Click    //input[contains(@name,'periodoDataCompetenciaFim')]
        Sleep    2s
        SeleniumLibrary.Press Keys    None     ${segunda_data}
        ScreenCapLibrary.Take Screenshot
        Commons.Wait And Click    //button[contains(.,'Aplicar')]
        Commons.Acessar informe
        Commons.Visivel    //p[contains(.,'Valor da cota é igual ao do dia útil anterior')]
        ScreenCapLibrary.Take Screenshot    name=InformesRepetidos.png
    END   
    
     