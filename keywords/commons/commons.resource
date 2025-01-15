*** Settings ***
Resource    ../../main.robot

*** Variables ***
@{ListPLC_NUM}

*** Keywords ***
Visivel
    [Arguments]    ${ELEMENT}    ${TIMEOUT}=5
    Wait Until Keyword Succeeds    3x    1s    SeleniumLibrary.Wait Until Element Is Visible    locator=${ELEMENT}    timeout=${TIMEOUT}

Combo
    [Arguments]    ${ELEMENT1}    ${ELEMENT2}
    Wait Until Keyword Succeeds    5x    3s    SeleniumLibrary.Wait Until Element Is Visible    locator=${ELEMENT1}    timeout=30    
    Wait Until Keyword Succeeds    5x    3s    SeleniumLibrary.Click Element    locator=${ELEMENT1}
    Wait Until Keyword Succeeds    5x    3s    SeleniumLibrary.Wait Until Element Is Visible    locator=${ELEMENT2}    timeout=45
    Wait Until Keyword Succeeds    5x    3s    SeleniumLibrary.Click Element    locator=${ELEMENT2}
    
Wait And Click
    [Arguments]    ${PATH}
    SeleniumLibrary.Wait Until Element Is Visible    locator=${PATH}    timeout=45s
    SeleniumLibrary.Click Element    locator=${PATH}

Wait And Input
    [Arguments]    ${PATH}    ${TEXT}
    SeleniumLibrary.Wait Until Element Is Visible    locator=${PATH}    
    SeleniumLibrary.Input Text    locator=${PATH}    text=${TEXT}

Set Specific Date
    [Arguments]    ${DAY}    ${MONTH}    ${YEAR}
    Sleep    4s
    Wait And Click    //input[@name='dataCompetencia']
    Sleep    5s
    SeleniumLibrary.Press Keys    None    ${DAY}${MONTH}${YEAR}

Set Specific Date Locale XY
    [Arguments]    ${DAY}    ${MONTH}    ${YEAR}    ${BTN}    ${X}    ${Y}
    Sleep    2s
    # SeleniumLibrary.Press Keys    //input[contains(@name,'codigoClasseSubclasse')]    TAB
    Wait And Click XY    ${BTN}    ${X}    ${Y}
    Sleep    2s
    SeleniumLibrary.Press Keys    None    ${DAY}${MONTH}${YEAR}

 Wait And Press Keys
    [Arguments]    ${PATH}    ${KEYS}
    SeleniumLibrary.Wait Until Element Is Visible    locator=${PATH}
    SeleniumLibrary.Press Keys    ${PATH}    ${KEYS}
    
Random Number
    [Arguments]    ${SIZE}
    ${RND_NUM}=    Generate Random String    length=${SIZE}    chars=[NUMBERS]
    ${RND_NUM}=    Convert To Integer    ${RND_NUM}
    Return From Keyword    ${RND_NUM}

Selecionar acesso para rentabilidade
    [Arguments]    ${ACESS}
    [Documentation]    O acesso pode ser: ITAU, BTG, BEM, BB, CAIXA, BRL, MERCANTIL
    Sleep    2s
    IF    "${ACESS}"=="ITAU" 
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'ITAU UNIBANCO SA')]
        IF    "${CHECK}"=="True"
            Return From Keyword
        END
    ELSE IF    "${ACESS}"=="BTG" 
        Sleep    4s
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'BTG PACTUAL SERVICOS FINANCEIROS SA DTVM')]
        IF    "${CHECK}"=="True"
            Return From Keyword
        END
    ELSE IF    "${ACESS}"=="BEM"
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'BEM DTVM')]
        IF    "${CHECK}"=="True"
            Return From Keyword
        END
    ELSE IF    "${ACESS}"=="BB" 
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'BB ASSET MANAGEMENT')]
        IF    "${CHECK}"=="True"
            Return From Keyword
        END
    ELSE IF    "${ACESS}"=="CAIXA" 
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'CAIXA')]
        IF    "${CHECK}"=="True"
            Return From Keyword
        END
    ELSE IF    "${ACESS}"=="BRL" 
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'BRL DTVM')]
        IF    "${CHECK}"=="True"
            Return From Keyword
        END
    ELSE IF    "${ACESS}"=="MERCANTIL" 
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'MERCANTIL DO BRASIL DTVM')]
        IF    "${CHECK}"=="True"
            Return From Keyword
        END
    END

Acessar informe
    Sleep    1s
    Commons.Wait And Click    //a[contains(@color,'primary')]

Acessar o PLCota
    Sleep    2s
    Combo    //p[contains(.,'Informes')]    //div[@class='MuiBox-root css-1wk9spg'][contains(.,'PL/Cota')]
    Sleep    2s
    Visivel    //h6[contains(.,'PL / Cota')]

Iniciar cadastro manual
    Wait And Click    //button[contains(.,'Cadastro manualPreencha o formulário')]
    visivel    //p[contains(.,'PL / Cota - Cadastro manual')]


Get Informe Number
    # //p[@class='MuiTypography-root MuiTypography-body2 css-xkx4c0'][contains(.,'Solicitação 0000006870 criada com sucesso.')]    
    [Documentation]    #Keyword que armazena na variável ${PLC_NUM} o numero do informe que é exibido no popup após submeter
    Visivel    //p[contains(.,'sucesso')]    45s		
    ${PLC_NUM}    SeleniumLibrary.Get Text    //p[contains(.,'sucesso')]		
    Log    ${PLC_NUM}
    ${PLC_NUM}=    Remove String    ${PLC_NUM}    Solicitação      criada com sucesso.
    Log    ${PLC_NUM.strip()}
    ${PLC_NUM}    Set Variable    ${PLC_NUM.strip()}
    Set Global Variable    ${PLC_NUM}


Get File Informe Number
    [Documentation]    #Keyword que armazena na variável ${PLC_NUM} o numero do informe que é exibido no popup após submeter
    Visivel    //p[contains(.,'registrada com sucesso!')]    15		#Visivel    //p[@class='MuiTypography-root MuiTypography-body2 css-zetry8'][contains(.,'Solicitação')]    15
    ${PLC_NUM}    SeleniumLibrary.Get Text    //p[contains(.,'registrada com sucesso!')]		#${PLC_NUM}    SeleniumLibrary.Get Text    //p[@class='MuiTypography-root MuiTypography-body2 css-zetry8'][contains(.,'Solicitação')]
    Log    ${PLC_NUM}
    ${PLC_NUM}=    Remove String    ${PLC_NUM}    Solicitação      registrada com sucesso!
    Log    ${PLC_NUM.strip()}
    ${PLC_NUM}    Set Variable    ${PLC_NUM.strip()}
    Set Global Variable    ${PLC_NUM}

Filtrar informe por numero envio de arquivo
    Wait And Click    //button[contains(.,'Filtro avançado')]
    # Clear Element Text    //input[contains(@name,'numeroSolicitacao')]
    Wait And Click    //input[contains(@name,'numeroSolicitacao')]
    SeleniumLibrary.Press Keys    //input[contains(@name,'numeroSolicitacao')]    CTRL+A+DELETE
    Wait And Input    //input[contains(@name,'numeroSolicitacao')]    ${PLC_NUM}
    Wait And Click    //button[contains(.,'Aplicar')]
    Sleep    1s

Filtrar informe por numero de justificativa
    Sleep    10s
    Wait And Click    //a[@color='primary'][contains(.,'Início')]
    Wait And Click    //button[contains(.,'Filtro avançado')]
    # Clear Element Text    //input[contains(@name,'numeroSolicitacao')]
    Wait And Click    //input[contains(@name,'numeroSolicitacao')]
    SeleniumLibrary.Press Keys    //input[contains(@name,'numeroSolicitacao')]    CTRL+A+DELETE
    Wait And Input    //input[contains(@name,'numeroSolicitacao')]    ${NumeroSolicitacao}
    Wait And Click    //button[contains(.,'Aplicar')]
    Sleep    1s
    Wait And Click    //td[contains(.,'${NumeroSolicitacao}')]
    Aprovar Exceção

Aprovar Exceção
    Commons.Combo    //div[@aria-labelledby='status status']    //li[contains(.,'Aprovado')]
    Commons.Wait And Click    //button[contains(.,'Atualizar solicitação')]


Set Today Date
    ${today}=  Get Time
    ${today_formated}=  Convert Date  ${today}  result_format=%d
    ${TODAY}=    Replace String Using Regexp    ${today_formated}    ^0    ${EMPTY}
    SeleniumLibrary.Wait Until Element Is Visible    locator=//button[contains(@aria-label,'Choose date')]     #//span[@class='MuiTypography-root MuiTypography-h5 MuiCardHeader-title css-1gton6h'][contains(.,'Dados cadastrais')]
    SeleniumLibrary.Click Element    locator=//button[contains(@aria-label,'Choose date')]      #//button[@class='MuiButtonBase-root MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium css-3a6q13'][contains(.,'Próximo')]
    Sleep    3s
    SeleniumLibrary.Wait Until Element Is Visible    locator=//button[@aria-current='date'][contains(.,'${TODAY}')]      #//div[@class='buttons-form MuiBox-root css-1bflpj3'][contains(.,'Próximo')]
    SeleniumLibrary.Click Element    locator=//button[@aria-current='date'][contains(.,'${TODAY}')]         #//button[@class='MuiButtonBase-root MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium css-3a6q13'][contains(.,'Próximo')]

Delay dinamico
    [Documentation]    Variável $First_Element corresponde ao primeiro elemento que será visível após a página carregar
    ...                Variável $delay corresponde ao tempo de espera
    [Arguments]    ${First_Element}    ${delay}
    FOR    ${i}    IN RANGE    0    ${delay}
        ${present}=  Run Keyword And Return Status    SeleniumLibrary.Element Should Be Visible    ${First_Element}
        Log    ${present}
        IF    ${present} == True
            Exit For Loop
        ELSE
            Sleep    1s
        END
    END

Set sulfixo
    [Arguments]    ${valid}
    IF    "${valid}"=="acoes"
        Wait And Click    //div[contains(@aria-labelledby,'sufixo')]
        Sleep    1s 
        # Wait And Click    //li[contains(.,'Ações BDR nível 1')]
        Wait And Click    //li[contains(.,'Mercado de acesso')]
        Wait And Click    //li[contains(.,'Investimento no Exterior')]
        Wait And Click    //p[contains(.,'Ações BDR nível 1')]
        Sleep    1s
        Wait And Click    //div[contains(@class,'MuiBackdrop-root MuiBackdrop-invisible MuiModal-backdrop css-esi9ax')]
        Sleep    1s
    ELSE IF    "${valid}"=="multimercado"
        Wait And Click    //div[contains(@aria-labelledby,'sufixo')]
        Sleep    1s 
        Wait And Click    //li[contains(.,'Investimento no Exterior')]
        Wait And Click    //li[contains(.,'Longo prazo')]
        Wait And Click    //li[contains(.,'Credito privado')]
        Sleep    1s
        Wait And Click    //div[contains(@class,'MuiBackdrop-root MuiBackdrop-invisible MuiModal-backdrop css-esi9ax')]
        Sleep    1s
    ELSE IF    "${valid}"=="renda fixa"
        Wait And Click    //div[contains(@aria-labelledby,'sufixo')]
        Sleep    1s 
        Wait And Click    //li[contains(.,'Referenciado')]
        Wait And Click    //li[contains(.,'Curto prazo')]
        Wait And Click    //li[contains(.,'Divida externa')]
        SeleniumLibrary.Scroll Element Into View    //li[contains(.,'Longo prazo')]
        Sleep    1s
        Wait And Click    //li[contains(.,'Investimento no Exterior')]
        Wait And Click    //li[contains(.,'Simples')]
        Wait And Click    //li[contains(.,'Credito privado')]
        Sleep    1s
        Wait And Click    //div[contains(@class,'MuiBackdrop-root MuiBackdrop-invisible MuiModal-backdrop css-esi9ax')]
        Sleep    1s
    ELSE IF    "${valid}"=="FIDC"
    ${passed}=    Run Keyword And Return Status    
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'sufixo')]
        IF    ${passed}==True    
            Wait And Click    //div[contains(@aria-labelledby,'sufixo')]
            Sleep    1s 
            SeleniumLibrary.Scroll Element Into View    //li[contains(.,'Não se aplica')]
            Sleep    1s
            Wait And Click    //li[contains(.,'Não se aplica')]
            Sleep    1s
            Wait And Click    //div[contains(@class,'MuiBackdrop-root MuiBackdrop-invisible MuiModal-backdrop css-esi9ax')]
            Sleep    1s
        END
    ELSE
        ${SETADO}    Run Keyword And Return Status    Visivel    //div[@class='MuiBox-root css-1ywof4l'][contains(.,'Não se aplica')]      #//span[contains(.,'Não se aplica')]
        IF    "${SETADO}"=="True"
            Return From Keyword
        ELSE
            Wait And Click    //div[contains(@aria-labelledby,'sufixo')]
            Sleep    1s 
            SeleniumLibrary.Scroll Element Into View    //li[contains(.,'Não se aplica')]
            Sleep    1s
            Wait And Click    //li[contains(.,'Não se aplica')]
            Sleep    1s
            Wait And Click    //div[contains(@class,'MuiBackdrop-root MuiBackdrop-invisible MuiModal-backdrop css-esi9ax')]
            Sleep    1s
        END
    END

Select Set Today
    [Arguments]    ${D}=1
    [Documentation]    A variável D vem como padrão com 1 para setar o dia de hoje, escolha: +1 para um dia a mais, -1 para um dia a menos, ou Skip para setar o próximo dia útil sendo hoje uma sexta.
    IF    "${D}"=="1"
        Set Today Date
    ELSE
        IF    "${D}"=="+1"
            Set Today Date +1
        ELSE
            IF    "${D}"=="-1"
                Set Today Date -1
            ELSE
                IF    "${D}"=="Skip"
                    Set Today Date Skip Weekend
                END
            END
        END
    END

Set Today Date +1
    ${today}=  Get Time
    ${today_formated}=  Convert Date  ${today}  result_format=%d
    ${TODAY}=    Replace String Using Regexp    ${today_formated}    ^0    ${EMPTY}
    ${TODAY}    Evaluate    ${TODAY} + 1
    SeleniumLibrary.Wait Until Element Is Visible    locator=//button[contains(@aria-label,'Choose date')]
    SeleniumLibrary.Click Element    locator=//button[contains(@aria-label,'Choose date')]
    ${status}    Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    locator=//button[contains(.,'${TODAY}')]
    IF     "${status}" == "False"
        ${TODAY}    Set Variable    01
        Wait And Click    //button[@aria-label='Next month']
    END   
    Wait And Click    //button[contains(.,'${TODAY}')]	    #SeleniumLibrary.Click Element    locator=//button[contains(.,'${TODAY}')]


Set Today Date -1
    ${today}=  Get Time
    ${today_formated}=  Convert Date  ${today}  result_format=%d
    ${TODAY}=    Replace String Using Regexp    ${today_formated}    ^0    ${EMPTY}
    ${TODAY}    Evaluate    ${TODAY} - 1
    SeleniumLibrary.Wait Until Element Is Visible    locator=//button[contains(@aria-label,'Choose date')]
    SeleniumLibrary.Click Element    locator=//button[contains(@aria-label,'Choose date')]
    SeleniumLibrary.Wait Until Element Is Visible    locator=//button[contains(.,'${TODAY}')]
    Wait And Click    //button[contains(.,'${TODAY}')]	    #SeleniumLibrary.Click Element    locator=//button[contains(.,'${TODAY}')]


Set Today Date Skip Weekend
    ${today}=  Get Time
    ${today_formated}=  Convert Date  ${today}  result_format=%d
    ${TODAY}=    Replace String Using Regexp    ${today_formated}    ^0    ${EMPTY}
    ${TODAY}    Evaluate    ${TODAY}    # + 3
    SeleniumLibrary.Wait Until Element Is Visible    locator=//button[contains(@aria-label,'Choose date')]
    SeleniumLibrary.Click Element    locator=//button[contains(@aria-label,'Choose date')]
    #SeleniumLibrary.Press Keys    NONE    END
    #SeleniumLibrary.Wait Until Element Is Visible    locator=//button[contains(.,'${TODAY}')]
    Wait And Click    //button[contains(.,'${TODAY}')]	    #SeleniumLibrary.Click Element    locator=//button[contains(.,'${TODAY}')]