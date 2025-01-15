*** Settings ***
Resource    ../../main.robot

*** Variables ***


*** Keywords ***
Validar exigencia de data diferente do ultimo dia do mes
    Commons.Get Informe Number
    Log    ${PLC_NUM}
    Commons.Visivel    //button[contains(.,'Filtro avançado')]
    Commons.Wait And Click    //button[contains(.,'Filtro avançado')]
    Commons.Wait And Input    //input[contains(@name,'numeroSolicitacao')]    ${PLC_NUM}
    Commons.Wait And Click    //button[contains(.,'Aplicar')]
    ${VALID}    Run Keyword And Return Status    Commons.Visivel    //td[contains(.,'Em processamento')]    5
    WHILE    "${VALID}"=="True"
        Commons.Filtrar informe por numero envio de arquivo
        Sleep    1s
        ${VALID}    Run Keyword And Return Status    Commons.Visivel    //td[contains(.,'Em processamento')]    5
    END
    # IF    "${PROCESSAMENTO}"=="Processado"
    #     Visivel    //span[contains(.,'Processado')]
    #     Sleep    2s    
    #     Wait And Click    //td[contains(.,'${PLC_NUM}')]            #Wait And Click    //a[contains(@color,'primary')]    #
    #     Wait And Click    //button[contains(.,'Processados')]
    #     Visivel    //span[contains(.,'Processado')]
    #     Sleep    1s 
    #     Take Screenshot    name=evidencia_${PROCESSAMENTO}.jpg
    # ELSE IF    "${PROCESSAMENTO}"=="Rejeitado"
    #         Visivel    //span[contains(.,'Possíveis Inconsistências')]
    #         Sleep    2s    
    #         Wait And Click    //td[contains(.,'${PLC_NUM}')]        #Wait And Click    //a[contains(@color,'primary')]    #
    #         Visivel    //span[contains(.,'Rejeitado')]
    #         Sleep    1s 
    #         Take Screenshot    name=evidencia_${PROCESSAMENTO}.jpg
    # END
    Commons.Visivel    //span[contains(.,'Possíveis Inconsistências')]
    Sleep    2s    
    Commons.Wait And Click    //td[contains(.,'${PLC_NUM}')]    
    Sleep    1s
    Commons.Wait And Click    //a[contains(@color,'primary')]
    Sleep    1s
    Commons.Visivel    //p[contains(.,'Subclasse informada divulga informações mensalmente e a data de competência não é o último dia útil do mês')]
    Log    Validada a competencia diferente do ultimo dia do mes