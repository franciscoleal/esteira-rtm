*** Settings ***

Resource    ../../main.robot

*** Keywords ***
Acessar o Menu Informes
    [Documentation]
    ...    Opções do menu para passagem como argumento:
    ...    PL/Cota    Rentabilidade    Justificativas
    [Arguments]    ${TIPO} 
    Sleep    2s
    ${submenu-plcota}    Replace String    string=${submenu-plcota}    search_for=TIPO    replace_with=${TIPO}
    Commons.Combo    ${menu-informes}    ${submenu-plcota}
    
    @{TIPOINFORME}    Create List
    ...    PL / Cota
    ...    Rentabilidade     
    ...    Listagem de justificativas 
                              
    IF    '${TIPO}' == 'PL\Cota' 
        ${submenu-plcota-h6}    Replace String    string=${submenu-plcota-h6}    search_for=TIPO    replace_with=${TIPOINFORME[0]}
        Sleep    2s
        Commons.Visivel    ${submenu-plcota-h6}
    ELSE IF    '${TIPO}' == 'Rentabilidade'
        ${submenu-plcota-h6}    Replace String    string=${submenu-plcota-h6}    search_for=TIPO    replace_with=${TIPOINFORME[1]}
        Sleep    2s
        Commons.Visivel    ${submenu-plcota-h6}
    ELSE IF    '${TIPO}' == 'Justificativas'    
        ${submenu-plcota-h6}    Replace String    string=${submenu-plcota-h6}    search_for=TIPO    replace_with=${TIPOINFORME[2]}
        Sleep    2s
        Commons.Visivel    ${submenu-plcota-h6}
    END