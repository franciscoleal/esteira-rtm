*** Settings ***

Resource    ../../main.robot

*** Variables ***


*** Keywords ***
Preencher cadastro PLCota inicial para limites
    [Arguments]    ${COTA}    ${PATRIMONIO}    ${COD_SCLASSE}=S0001074059    ${COTISTA}=0    &{DATA}
    
    # Obter as rentabilidades    ${TIPO_ANBIMA}

    Commons.Wait And Input    //input[contains(@name,'codigoClasseSubclasse')]    ${COD_SCLASSE}
    Commons.Set Specific Date    ${DATA.DIA}    ${DATA.MES}    ${DATA.ANO}   

    Commons.Wait And Input    //input[contains(@name,'valorCota')]    ${COTA}
    ${COTA}    Replace String    ${COTA}    ,    .
    ${COTA}    Convert To Number    ${COTA}
    Set Global Variable    ${COTA}
    
    Commons.Wait And Input    //input[contains(@name,'patrimonioLiquido')]    ${PATRIMONIO}
    ${PATRIMONIO}    Replace String    ${PATRIMONIO}    ,    .
    ${PATRIMONIO}    Convert To Number    ${PATRIMONIO}
    Set Global Variable    ${PATRIMONIO} 

    Commons.Wait And Input    //input[contains(@name,'volumeTotalAplicacoes')]    0
    Commons.Wait And Input    //input[contains(@name,'volumeTotalResgates')]    0
    Commons.Wait And Input    //input[contains(@name,'volumeTotalResgateIR')]    0
    Commons.Wait And Input    //input[contains(@name,'numeroCotistas')]    ${COTISTA}
    Commons.Wait And Click    //button[contains(.,'Submeter')]

    Set Global Variable    ${COTISTA}

    # Set Global Variable    ${PERCENT-SE}    ${SuperiorExterno}
    # Set Global Variable    ${PERCENT-SI}    ${SuperiorInterno}
    # Set Global Variable    ${PERCENT-II}    ${InferiorInterno}
    # Set Global Variable    ${PERCENT-IE}    ${InferiorExterno}

    # Commons.Get Informe Number

Preencher cadastro limites PLCota ${LIMIT}
    [Arguments]    ${PERCENT}   ${COD_SCLASSE}    &{DATA}

    ${PERCENT}    Convert To Number    ${PERCENT}
    Set Global Variable    ${LIMIT}
    
    IF    "${LIMIT}"=="Superior Externo"
        Commons.Wait And Input    //input[contains(@name,'codigoClasseSubclasse')]    ${COD_SCLASSE}
        Commons.Set Specific Date    ${DATA.DIA}    ${DATA.MES}    ${DATA.ANO}

        ${COTA}    Evaluate    ${COTA}+((${COTA}*${PERCENT})/100)
        ${PATRIMONIO}    Evaluate    ${PATRIMONIO}+${COTA}

        
        ${COTA}    Convert To String    ${COTA}
        ${COTA}    Replace String    ${COTA}    .    ,
        Commons.Wait And Input    //input[contains(@name,'valorCota')]    ${COTA}

        ${PATRIMONIO}    Convert To String    ${PATRIMONIO}
        ${PATRIMONIO}    Replace String    ${PATRIMONIO}    .    ,
        Commons.Wait And Input    //input[contains(@name,'patrimonioLiquido')]    ${PATRIMONIO}
        
        ${COTA}    Replace String    ${COTA}    ,    .
        ${COTA}    Convert To Number    ${COTA}
        Set Global Variable    ${COTA}

        ${PATRIMONIO}    Replace String    ${PATRIMONIO}    ,    .
        ${PATRIMONIO}    Convert To Number    ${PATRIMONIO}
        Set Global Variable    ${PATRIMONIO}


        Commons.Wait And Input    //input[contains(@name,'volumeTotalAplicacoes')]    0
        Commons.Wait And Input    //input[contains(@name,'volumeTotalResgates')]    0
        Commons.Wait And Input    //input[contains(@name,'volumeTotalResgateIR')]    0
        Commons.Wait And Input    //input[contains(@name,'numeroCotistas')]    ${COTISTA}
        Sleep    2s
        Commons.Wait And Click    //button[contains(.,'Submeter')]
        
        # Commons.Get Informe Number

        # Append To List    ${ListPLC_NUM&LIMIT}    ${LIMITE}-${PLC_NUM}
        # Log    message=${ListPLC_NUM&LIMIT}    

    
    ELSE IF    "${LIMIT}"=="Superior Interno"

        Commons.Wait And Input    //input[contains(@name,'codigoClasseSubclasse')]    ${COD_SCLASSE}
        Commons.Set Specific Date    ${DATA.DIA}    ${DATA.MES}    ${DATA.ANO}

        ${COTA}    Evaluate    ${COTA}+((${COTA}*${PERCENT})/100)
        ${PATRIMONIO}    Evaluate    ${PATRIMONIO}+${COTA}
        
        ${COTA}    Convert To String    ${COTA}
        ${COTA}    Replace String    ${COTA}    .    ,
        Commons.Wait And Input    //input[contains(@name,'valorCota')]    ${COTA}

        ${PATRIMONIO}    Convert To String    ${PATRIMONIO}
        ${PATRIMONIO}    Replace String    ${PATRIMONIO}    .    ,
        Commons.Wait And Input    //input[contains(@name,'patrimonioLiquido')]    ${PATRIMONIO}
        
        ${COTA}    Replace String    ${COTA}    ,    .
        ${COTA}    Convert To Number    ${COTA}
        Set Global Variable    ${COTA}
        ${PATRIMONIO}    Replace String    ${PATRIMONIO}    ,    .
        ${PATRIMONIO}    Convert To Number    ${PATRIMONIO}
        Set Global Variable    ${PATRIMONIO}

        Commons.Wait And Input    //input[contains(@name,'volumeTotalAplicacoes')]    0
        Commons.Wait And Input    //input[contains(@name,'volumeTotalResgates')]    0
        Commons.Wait And Input    //input[contains(@name,'volumeTotalResgateIR')]    0
        Commons.Wait And Input    //input[contains(@name,'numeroCotistas')]    ${COTISTA}
        Sleep    2s
        Commons.Wait And Click    //button[contains(.,'Submeter')]
        
    ELSE IF    "${LIMIT}"=="Inferior Interno"

        Commons.Wait And Input    //input[contains(@name,'codigoClasseSubclasse')]    ${COD_SCLASSE}
        Commons.Set Specific Date    ${DATA.DIA}    ${DATA.MES}    ${DATA.ANO}

        ${COTA}    Evaluate    ${COTA}+((${COTA}*${PERCENT})/100)
        ${PATRIMONIO}    Evaluate    ${PATRIMONIO}+${COTA}
        
        ${COTA}    Convert To String    ${COTA}
        ${COTA}    Replace String    ${COTA}    .    ,
        Commons.Wait And Input    //input[contains(@name,'valorCota')]    ${COTA}
        
        ${PATRIMONIO}    Convert To String    ${PATRIMONIO}
        ${PATRIMONIO}    Replace String    ${PATRIMONIO}    .    ,
        Commons.Wait And Input    //input[contains(@name,'patrimonioLiquido')]    ${PATRIMONIO}
        
        ${COTA}    Replace String    ${COTA}    ,    .
        ${COTA}    Convert To Number    ${COTA}
        Set Global Variable    ${COTA}
        ${PATRIMONIO}    Replace String    ${PATRIMONIO}    ,    .
        ${PATRIMONIO}    Convert To Number    ${PATRIMONIO}
        Set Global Variable    ${PATRIMONIO}

        Commons.Wait And Input    //input[contains(@name,'volumeTotalAplicacoes')]    0
        Commons.Wait And Input    //input[contains(@name,'volumeTotalResgates')]    0
        Commons.Wait And Input    //input[contains(@name,'volumeTotalResgateIR')]    0
        Commons.Wait And Input    //input[contains(@name,'numeroCotistas')]    ${COTISTA}
        Sleep    2s
        Commons.Wait And Click    //button[contains(.,'Submeter')]
    
    ELSE IF    "${LIMIT}"=="Inferior Externo"
    
        Commons.Wait And Input    //input[contains(@name,'codigoClasseSubclasse')]    ${COD_SCLASSE}
        Commons.Set Specific Date    ${DATA.DIA}    ${DATA.MES}    ${DATA.ANO} 

        ${COTA}    Evaluate    ${COTA}+((${COTA}*${PERCENT})/100)
        ${PATRIMONIO}    Evaluate    ${PATRIMONIO}+${COTA}
        
        ${COTA}    Convert To String    ${COTA}
        ${COTA}    Replace String    ${COTA}    .    ,
        Commons.Wait And Input    //input[contains(@name,'valorCota')]    ${COTA}
        
        ${PATRIMONIO}    Convert To String    ${PATRIMONIO}
        ${PATRIMONIO}    Replace String    ${PATRIMONIO}    .    ,
        Commons.Wait And Input    //input[contains(@name,'patrimonioLiquido')]    ${PATRIMONIO}
        
        ${COTA}    Replace String    ${COTA}    ,    .
        ${COTA}    Convert To Number    ${COTA}
        Set Global Variable    ${COTA}
        ${PATRIMONIO}    Replace String    ${PATRIMONIO}    ,    .
        ${PATRIMONIO}    Convert To Number    ${PATRIMONIO}
        Set Global Variable    ${PATRIMONIO}

        Commons.Wait And Input    //input[contains(@name,'volumeTotalAplicacoes')]    0
        Commons.Wait And Input    //input[contains(@name,'volumeTotalResgates')]    0
        Commons.Wait And Input    //input[contains(@name,'volumeTotalResgateIR')]    0
        Commons.Wait And Input    //input[contains(@name,'numeroCotistas')]    ${COTISTA}
        Sleep    2s
        Commons.Wait And Click    //button[contains(.,'Submeter')]

    ELSE IF    "${LIMIT}"=="Limite Medio"
        Commons.Wait And Input    //input[contains(@name,'codigoClasseSubclasse')]    ${COD_SCLASSE}
        Commons.Set Specific Date    08    07    2024

        ${COTA}    Evaluate    ${COTA}+((${COTA}*${PERCENT})/100)
        ${PATRIMONIO}    Evaluate    ${PATRIMONIO}+${COTA}
        
        ${COTA}    Convert To String    ${COTA}
        ${COTA}    Replace String    ${COTA}    .    ,
        Commons.Wait And Input    //input[contains(@name,'valorCota')]    ${COTA}
        
        ${PATRIMONIO}    Convert To String    ${PATRIMONIO}
        ${PATRIMONIO}    Replace String    ${PATRIMONIO}    .    ,
        Commons.Wait And Input    //input[contains(@name,'patrimonioLiquido')]    ${PATRIMONIO}
        
        ${COTA}    Replace String    ${COTA}    ,    .
        ${COTA}    Convert To Number    ${COTA}
        Set Global Variable    ${COTA}
        ${PATRIMONIO}    Replace String    ${PATRIMONIO}    ,    .
        ${PATRIMONIO}    Convert To Number    ${PATRIMONIO}
        Set Global Variable    ${PATRIMONIO}

        Commons.Wait And Input    //input[contains(@name,'volumeTotalAplicacoes')]    0
        Commons.Wait And Input    //input[contains(@name,'volumeTotalResgates')]    0
        Commons.Wait And Input    //input[contains(@name,'volumeTotalResgateIR')]    0
        Commons.Wait And Input    //input[contains(@name,'numeroCotistas')]    ${COTISTA}
        Sleep    2s
        Commons.Wait And Click    //button[contains(.,'Submeter')]
    END
