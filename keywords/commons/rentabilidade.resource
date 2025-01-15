*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Obter as rentabilidades
    [Arguments]    ${TIPO-ANBIMA}
    ${tabelaRentabilidade}    Read table from CSV    ${EXECDIR}${/}plcota${/}resources${/}data${/}rentabilidades.csv    encoding=utf-8-sig
    @{tipoAnbima}    Get Table Column    ${tabelaRentabilidade}    Tipo ANBIMA        
    
    Log Many    @{tipoAnbima}
    
    FOR    ${tipo}    IN    @{tipoAnbima}
        IF    '${tipo}' != '${TIPO-ANBIMA}'    
            CONTINUE
        ELSE
            ${limites}    Find Table Rows
            ...    table=${tabelaRentabilidade}
            ...    column=Tipo ANBIMA
            ...    operator===
            ...    value=${tipo}
        END
    END
    ${limites}    Create Table    data=${limites}
    ${limiteMinimo}    RPA.Tables.Get Table Column    ${limites}    Limite Mínimo
    ${limiteMaximo}    RPA.Tables.Get Table Column    ${limites}    Limite Máximo
    Log To Console    ${limites}  
    ${limiteMinimo}    Convert To String    ${limiteMinimo} 
    ${limiteMaximo}    Convert To String    ${limiteMaximo} 

    ${limiteMinimo}    Remove String    ${limiteMinimo}    ['    %']
    ${limiteMaximo}    Remove String    ${limiteMaximo}    ['    %']

    ${limiteMinimo}    Replace String    ${limiteMinimo}    ,    .  
    ${limiteMinimo}    Convert To Number    ${limiteMinimo}
    
    ${limiteMaximo}    Replace String    ${limiteMaximo}    ,    .  
    ${limiteMaximo}    Convert To Number    ${limiteMaximo}
     
    ${numero}    Set Variable    ${limiteMinimo}-0.01
    ${InferiorExterno}    Evaluate    format(${numero}, ".2f")
    
    ${numero}    Set Variable    ${limiteMinimo}+0.01
    ${InferiorInterno}    Evaluate    format(${numero}, ".2f")
    
    ${numero}    Set Variable    ${limiteMaximo}-0.01
    ${SuperiorInterno}    Evaluate    format(${numero}, ".2f")
    
    ${numero}    Set Variable    ${limiteMaximo}+0.01
    ${SuperiorExterno}    Evaluate    format(${numero}, ".2f")

    Set Global Variable    ${SuperiorExterno}
    Set Global Variable    ${SuperiorInterno}
    Set Global Variable    ${InferiorInterno}
    Set Global Variable    ${InferiorExterno}