*** Settings ***

# "../" - pasta anterior
Resource    Massa.robot

*** Keywords ***

Abrir o navegador
    Remove File    selenium-screenshot-1.png
    Remove File    screenshot_1.gif
    Open Browser    browser=chrome    #<--   Setando o navegador(edge, chrome, firefox, headlesschrome)  
    Delete All Cookies
    Maximize Browser Window
    # Start Gif Recording


Fechar o navegador
    # Stop Gif Recording
    #Alterar acesso para Administrador
    Close Browser

Visivel
    [Arguments]    ${ELEMENT}    ${TIMEOUT}=30
    Wait Until Keyword Succeeds    1x    1s    SeleniumLibrary.Wait Until Element Is Visible    locator=${ELEMENT}    timeout=${TIMEOUT}

Combo
    [Arguments]    ${ELEMENT1}    ${ELEMENT2}  
    Wait Until Keyword Succeeds    3x    3s    SeleniumLibrary.Wait Until Element Is Visible    locator=${ELEMENT1}    timeout=30    
    SeleniumLibrary.Click Element    locator=${ELEMENT1}
    Wait Until Keyword Succeeds    3x    3s    SeleniumLibrary.Wait Until Element Is Visible    locator=${ELEMENT2}    timeout=30
    SeleniumLibrary.Click Element    locator=${ELEMENT2}

Set Today Date
    ${today}=  Get Time
    ${today_formated}=  Convert Date  ${today}  result_format=%d
    ${TODAY}=    Replace String Using Regexp    ${today_formated}    ^0    ${EMPTY}
    SeleniumLibrary.Wait Until Element Is Visible    locator=//button[contains(@aria-label,'Choose date')]     #//span[@class='MuiTypography-root MuiTypography-h5 MuiCardHeader-title css-1gton6h'][contains(.,'Dados cadastrais')]
    SeleniumLibrary.Click Element    locator=//button[contains(@aria-label,'Choose date')]      #//button[@class='MuiButtonBase-root MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium css-3a6q13'][contains(.,'Próximo')]
    Sleep    3s
    SeleniumLibrary.Wait Until Element Is Visible    locator=//button[@aria-current='date'][contains(.,'${TODAY}')]      #//div[@class='buttons-form MuiBox-root css-1bflpj3'][contains(.,'Próximo')]
    SeleniumLibrary.Click Element    locator=//button[@aria-current='date'][contains(.,'${TODAY}')]         #//button[@class='MuiButtonBase-root MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium css-3a6q13'][contains(.,'Próximo')]

Alter Set Today Date
    ${today}=  Get Time
    ${today_formated}=  Convert Date  ${today}  result_format=%d
    ${TODAY}=    Replace String Using Regexp    ${today_formated}    ^0    ${EMPTY}
    SeleniumLibrary.Wait Until Element Is Visible    locator=//*[@id="__next"]/main/div[2]/div/div[3]/div[2]/div[2]/div/div/table/tbody/tr[2]/td[4]/form/div/div/div/button
    SeleniumLibrary.Click Element    locator=//*[@id="__next"]/main/div[2]/div/div[3]/div[2]/div[2]/div/div/table/tbody/tr[2]/td[4]/form/div/div/div/button
    Sleep    2s
    SeleniumLibrary.Wait Until Element Is Visible    locator=//button[@aria-current='date'][contains(.,'${TODAY}')]      #//div[@class='buttons-form MuiBox-root css-1bflpj3'][contains(.,'Próximo')]
    SeleniumLibrary.Click Element    locator=//button[@aria-current='date'][contains(.,'${TODAY}')]         #//button[@class='MuiButtonBase-root MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium css-3a6q13'][contains(.,'Próximo')]

Alter Set Today Date 3
    ${today}=  Get Time
    ${today_formated}=  Convert Date  ${today}  result_format=%d
    ${TODAY}=    Replace String Using Regexp    ${today_formated}    ^0    ${EMPTY}
    SeleniumLibrary.Wait Until Element Is Visible    locator=//div/main/div[3]/div/div[2]/div[2]/div[2]/div/div/table/tbody/tr[3]/td[4]/form/div/div/div/button
    SeleniumLibrary.Click Element    locator=//div/main/div[3]/div/div[2]/div[2]/div[2]/div/div/table/tbody/tr[3]/td[4]/form/div/div/div/button
    Sleep    2s
    SeleniumLibrary.Wait Until Element Is Visible    locator=//button[@aria-current='date'][contains(.,'${TODAY}')]      #//div[@class='buttons-form MuiBox-root css-1bflpj3'][contains(.,'Próximo')]
    SeleniumLibrary.Click Element    locator=//button[@aria-current='date'][contains(.,'${TODAY}')]         #//button[@class='MuiButtonBase-root MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium css-3a6q13'][contains(.,'Próximo')]


Set Today Date +1
    ${today}=  Get Time
    ${today_formated}=  Convert Date  ${today}  result_format=%d
    ${TODAY}=    Replace String Using Regexp    ${today_formated}    ^0    ${EMPTY}
    ${TODAY}    Evaluate    ${TODAY} + 1
    SeleniumLibrary.Wait Until Element Is Visible    locator=//button[contains(@aria-label,'Choose date')]
    SeleniumLibrary.Click Element    locator=//button[contains(@aria-label,'Choose date')]
    Pause Execution
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

Set Date
    [Arguments]    ${DATE}
    SeleniumLibrary.Wait Until Element Is Visible    locator=//button[contains(@aria-label,'Choose date')]
    SeleniumLibrary.Click Element    locator=//button[contains(@aria-label,'Choose date')]
    SeleniumLibrary.Wait Until Element Is Visible    locator=//button[contains(.,'${DATE}')]
    SeleniumLibrary.Click Element    locator=//button[contains(.,'${DATE}')]

Set Date Last Month
    [Arguments]    ${DATE}
    SeleniumLibrary.Wait Until Element Is Visible    locator=//button[contains(@aria-label,'Choose date')]
    SeleniumLibrary.Click Element    locator=//button[contains(@aria-label,'Choose date')]
    Wait And Click    //button[contains(@aria-label,'Previous month')]
    Sleep    2s
    SeleniumLibrary.Wait Until Element Is Visible    locator=//button[contains(.,'${DATE}')]
    SeleniumLibrary.Click Element    locator=//button[contains(.,'${DATE}')]

Set Today Date +2 Last Month
    ${today}=  Get Time
    ${today_formated}=  Convert Date  ${today}  result_format=%d
    ${TODAY}=    Replace String Using Regexp    ${today_formated}    ^0    ${EMPTY}
    ${TODAY}    Evaluate    ${TODAY} + 2
    SeleniumLibrary.Wait Until Element Is Visible    locator=//button[contains(@aria-label,'Choose date')]
    SeleniumLibrary.Click Element    locator=//button[contains(@aria-label,'Choose date')]
    Wait And Click    //button[contains(@aria-label,'Previous month')]
    Sleep    2s
    SeleniumLibrary.Wait Until Element Is Visible    locator=//button[contains(.,'${TODAY}')]
    Wait And Click    //button[contains(.,'${TODAY}')]	    #SeleniumLibrary.Click Element    locator=//button[contains(.,'${TODAY}')]

Set Today Date Last Month
    ${today}=  Get Time
    ${today_formated}=  Convert Date  ${today}  result_format=%d
    ${TODAY}=    Replace String Using Regexp    ${today_formated}    ^0    ${EMPTY}
    SeleniumLibrary.Wait Until Element Is Visible    locator=//button[contains(@aria-label,'Choose date')]
    SeleniumLibrary.Click Element    locator=//button[contains(@aria-label,'Choose date')]
    Wait And Click    //button[contains(@aria-label,'Previous month')]
    Sleep    2s
    SeleniumLibrary.Wait Until Element Is Visible    locator=//button[contains(.,'${TODAY}')]
    Wait And Click    //button[contains(.,'${TODAY}')]	    #SeleniumLibrary.Click Element    locator=//button[contains(.,'${TODAY}')]

Set Today Date Locale
    [Arguments]    ${BTN}
    ${today}=  Get Time
    ${today_formated}=  Convert Date  ${today}  result_format=%d
    ${TODAY}=    Replace String Using Regexp    ${today_formated}    ^0    ${EMPTY}
    SeleniumLibrary.Click Element    locator=${BTN}
    SeleniumLibrary.Wait Until Element Is Visible    locator=//button[@aria-current='date'][contains(.,'${TODAY}')]
    SeleniumLibrary.Click Element    locator=//button[@aria-current='date'][contains(.,'${TODAY}')]

Set Today Date 1 Year Before
    ${today}=  Get Time
    ${today_formated}=  Convert Date  ${today}  result_format=%d
    ${TODAY}=    Replace String Using Regexp    ${today_formated}    ^0    ${EMPTY}
    SeleniumLibrary.Wait Until Element Is Visible    locator=//button[contains(@aria-label,'Choose date')]
    SeleniumLibrary.Click Element    locator=//button[contains(@aria-label,'Choose date')]
    Wait And Click    //button[@aria-label='calendar view is open, switch to year view']
    Wait And Click    //button[@type='button'][contains(.,'2023')]
    Sleep    2s
    Wait And Click    //button[contains(.,'${TODAY}')]
    Sleep    2s
    
Set Specific Date
    [Arguments]    ${DAY}    ${MONTH}    ${YEAR}
    Sleep    4s
    # SeleniumLibrary.Press Keys    //input[contains(@name,'codigoClasseSubclasse')]    TAB
    Wait And Click    //input[contains(@placeholder,'DD/MM/YYYY')]
    Sleep    5s       
    SeleniumLibrary.Press Keys    None    ${DAY}${MONTH}${YEAR}
    
Set Valid CNPJ
    ${CNPJ}   FakerLibrary.CNPJ
    Return From Keyword    ${CNPJ}

Set Specific Date Locale XY
    [Arguments]    ${DAY}    ${MONTH}    ${YEAR}    ${BTN}    ${X}    ${Y}
    Sleep    2s
    # SeleniumLibrary.Press Keys    //input[contains(@name,'codigoClasseSubclasse')]    TAB
    Wait And Click XY    ${BTN}    ${X}    ${Y}
    Sleep    2s
    SeleniumLibrary.Press Keys    None    ${DAY}${MONTH}${YEAR}


Wait And Click
    [Arguments]    ${PATH}
    SeleniumLibrary.Wait Until Element Is Visible    locator=${PATH}
    SeleniumLibrary.Click Element    locator=${PATH}

Wait And Click XY
    [Arguments]    ${PATH}    ${X}    ${Y}
    SeleniumLibrary.Wait Until Element Is Visible    locator=${PATH}
    SeleniumLibrary.Click Element At Coordinates    locator=${PATH}    xoffset=${X}    yoffset=${Y}

Wait And Input
    [Arguments]    ${PATH}    ${TEXT}
    SeleniumLibrary.Wait Until Element Is Visible    locator=${PATH}
    SeleniumLibrary.Input Text    locator=${PATH}    text=${TEXT}

Loading
    [Arguments]    ${TIME}="10"
    SeleniumLibrary.Wait Until Element Is Not Visible    locator=//img[contains(@alt,'Loader icon to await keycloak validations')]    timeout=${TIME}

Selecionar acesso
    [Arguments]    ${ACESS}
    Set Global Variable    ${ACESS}
    ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'${ACESS}')]
    IF    "${CHECK}"=="True"
        Return From Keyword
    END
    Wait And Click    //div[@class='MuiStack-root css-j7qwjs'][contains(.,'DANIELE SAORI NEGORO')]
    Wait And Click    //li[contains(.,'Meus acessos')]
    SeleniumLibrary.Wait Until Element Is Visible    locator=//p[contains(.,'Meus acessos')]
    IF    "${ACESS}"=="Administrador"
        Wait And Click    (//p[contains(.,'Selecionar')])[2]    #(//button[contains(.,'Selecionar')])[1]
        ${CHECK}    Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    locator=//p[contains(.,'Administrador')]
        IF    ${CHECK}==False 
            Wait And Click    //div[@class='MuiStack-root css-j7qwjs'][contains(.,'Vimerson Miura')]
            Wait And Click    //li[contains(.,'Meus acessos')]
            SeleniumLibrary.Wait Until Element Is Visible    locator=//p[contains(.,'Meus acessos')]
            Wait And Click    (//p[contains(.,'Selecionar')])[2]    #(//button[contains(.,'Selecionar')])[1]
            Selecionar acesso    Administrador
        END
    ELSE
    IF    "${ACESS}"=="Autorregulador"
        Wait And Click    (//button[contains(.,'Selecionar')])[2]
        ${CHECK}    Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    locator=//p[contains(.,'Autorregulador')]
        IF    ${CHECK}==False 
            Wait And Click    //div[@class='MuiStack-root css-j7qwjs'][contains(.,'Vimerson Miura')]
            Wait And Click    //li[contains(.,'Meus acessos')]
            SeleniumLibrary.Wait Until Element Is Visible    locator=//p[contains(.,'Meus acessos')]
            Wait And Click    (//button[contains(.,'Selecionar')])[1]
            Selecionar acesso    Autorregulador
        END
    ELSE
    IF    "${ACESS}"=="Gestor"
        Wait And Click    (//button[contains(.,'Selecionar')])[4]
        ${CHECK}    Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    locator=//p[contains(.,'Gestor')]
        IF    ${CHECK}==False 
            Wait And Click    //div[@class='MuiStack-root css-j7qwjs'][contains(.,'Vimerson Miura')]
            Wait And Click    //li[contains(.,'Meus acessos')]
            SeleniumLibrary.Wait Until Element Is Visible    locator=//p[contains(.,'Meus acessos')]
            Wait And Click    (//button[contains(.,'Selecionar')])[1]
            Selecionar acesso    Gestor
        END
    ELSE
    IF    "${ACESS}"=="Informante"
        Wait And Click    (//button[contains(.,'Selecionar')])[3]
        ${CHECK}    Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    locator=//p[contains(.,'Informante')]
        IF    ${CHECK}==False 
            Wait And Click    //div[@class='MuiStack-root css-j7qwjs'][contains(.,'Vimerson Miura')]
            Wait And Click    //li[contains(.,'Meus acessos')]
            SeleniumLibrary.Wait Until Element Is Visible    locator=//p[contains(.,'Meus acessos')]
            Wait And Click    (//button[contains(.,'Selecionar')])[1]
            Selecionar acesso    Informante
        END
    END
    END
    END
    END
    

#Selecionar acesso Admin
#    Wait And Click    //div[@class='MuiStack-root css-j7qwjs'][contains(.,'Vimerson Miura')]
#    Wait And Click    //li[contains(.,'Meus acessos')]
#    SeleniumLibrary.Wait Until Element Is Visible    locator=//p[contains(.,'Meus acessos')] 
#    Wait And Click    (//p[contains(.,'Selecionar')])[2]

#Selecionar Sysadmin
#    Wait And Click    //div[@class='MuiStack-root css-j7qwjs'][contains(.,'Vimerson Miura')]
#    Wait And Click    //li[contains(.,'Meus acessos')]
#    SeleniumLibrary.Wait Until Element Is Visible    locator=//p[contains(.,'Meus acessos')]
#    Wait And Click    (//button[contains(.,'Selecionar')])[1]
#    Sleep    3s
#    SeleniumLibrary.Wait Until Element Is Visible    locator=//img[contains(@alt,'Logo da Anbima')]
#    Sleep    3s
#    SeleniumLibrary.Wait Until Element Is Visible    locator=//input[contains(@placeholder,'Nome de usuário ou e-mail')]
#    Sleep    2s
#    SeleniumLibrary.Input Text    locator=//input[contains(@placeholder,'Nome de usuário ou e-mail')]    text=daniele.negoro@vericode.com.br
#    SeleniumLibrary.Wait Until Element Is Visible    locator=//input[contains(@placeholder,'Senha')]
#    Input Password    locator=//input[contains(@placeholder,'Senha')]    password=Vimer@25102009
#    Wait And Click    //input[contains(@value,'Entrar')]
#    ${CHECK}    Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    locator=//p[contains(.,'Sysadmin')]
#    IF    ${CHECK}==False 
#            Wait And Click    //div[@class='MuiStack-root css-j7qwjs'][contains(.,'Vimerson Miura')]
#            Wait And Click    //li[contains(.,'Meus acessos')]
#            SeleniumLibrary.Wait Until Element Is Visible    locator=//p[contains(.,'Meus acessos')]
#            Wait And Click    (//button[contains(.,'Selecionar')])[1]
#            Wait And Click    //input[contains(@value,'Entrar')]
#            Selecionar Sysadmin
#        END
#
#Selecionar acesso para rentabilidade
#    [Arguments]    ${ACESS}
#    [Documentation]    O acesso pode ser: 5G, Rabobank, BRL Trust, BTG, Kamaroopin, Kilima, Unicred, Upon
#    Return From Keyword
#     Sleep    2s
#     IF    "${ACESS}"=="5G" 
#         ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'5G CAPITAL COBRANCAS LTDA')]
#         IF    "${CHECK}"=="True"
#         Return From Keyword
#         END
#     ELSE
#     IF    "${ACESS}"=="Rabobank" 
#         ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'BANCO RABOBANK INTERNACIONAL BRASIL S A')]
#         IF    "${CHECK}"=="True"
#         Return From Keyword
#         END
#     ELSE
#     IF    "${ACESS}"=="BRL Trust" 
#         ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'BRL TRUST SERVICOS FIDUCIARIOS E PARTICIPACOES LTDA')]
#         IF    "${CHECK}"=="True"
#         Return From Keyword
#         END
#     ELSE
#     IF    "${ACESS}"=="BTG" 
#         ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'BTG PACTUAL WM GESTAO DE RECURSOS LTDA')]
#         IF    "${CHECK}"=="True"
#         Return From Keyword
#         END
#     ELSE
#     IF    "${ACESS}"=="Kamaroopin" 
#         ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'KAMAROOPIN GESTORA DE RECURSOS LTDA.')]
#         IF    "${CHECK}"=="True"
#         Return From Keyword
#         END
#     ELSE
#     IF    "${ACESS}"=="Kilima" 
#         ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'KILIMA GESTAO DE RECURSOS LTDA')]
#         IF    "${CHECK}"=="True"
#         Return From Keyword
#         END
#     ELSE
#     IF    "${ACESS}"=="Unicred" 
#         ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'UNICRED NATAL')]
#         IF    "${CHECK}"=="True"
#         Return From Keyword
#         END
#     ELSE
#     IF    "${ACESS}"=="Upon" 
#         ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'UPON GESTORA DE RECURSOS MACRO LTDA')]
#         IF    "${CHECK}"=="True"
#         Return From Keyword
#         END
#     END
#     END
#     END
#     END
#     END
#     END
#     END
#     END
#       
#     ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'Sysadmin')]
#     IF    "${CHECK}"=="False"
#         Sleep    2s
#         Wait And Click    //div[contains(@class,'user-container MuiBox-root css-1mv69se')]
#         Wait And Click    //li[contains(.,'Meus acessos')]
#         #Setando SysAdmin para começar os testes
#         Wait And Click    (//button[contains(.,'Selecionar')])[1]
#         ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'Sysadmin')]
#         IF    "${CHECK}"=="False"
#             Sleep    2s
#             Wait And Click    //div[contains(@class,'user-container MuiBox-root css-1mv69se')]
#             Wait And Click    //li[contains(.,'Meus acessos')]
#             #Setando SysAdmin para começar os testes, caso não tenha sido selecionado ainda
#             Wait And Click    (//button[contains(.,'Selecionar')])[1]
#             Visivel    //p[contains(.,'Sysadmin')]
#         END
#     END
#     IF    "${ACESS}"=="5G"
#         ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'5G CAPITAL COBRANCAS LTDA')]
#         IF    "${CHECK}"=="True"
#             Return From Keyword
#         END
#         Sleep    2s
#         Wait And Click    //div[contains(@class,'user-container MuiBox-root css-1mv69se')]
#         Wait And Click    //li[contains(.,'Meus acessos')]
#         Visivel    (//button[contains(.,'Selecionar')])[2]
#         Scroll Element Into View    (//button[contains(.,'Selecionar')])[2]
#         Wait And Click    (//button[contains(.,'Selecionar')])[2]
#         Visivel    //p[contains(.,'5G CAPITAL COBRANCAS LTDA')]
#     ELSE
#     IF    "${ACESS}"=="Rabobank"
#         ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'BANCO RABOBANK INTERNACIONAL BRASIL S A')]
#         IF    "${CHECK}"=="True"
#             Return From Keyword
#         END
#         Sleep    2s
#         Wait And Click    //div[contains(@class,'user-container MuiBox-root css-1mv69se')]
#         Wait And Click    //li[contains(.,'Meus acessos')]
#         Visivel    (//button[contains(.,'Selecionar')])[3]
#         Scroll Element Into View    (//button[contains(.,'Selecionar')])[3]
#         Wait And Click    (//button[contains(.,'Selecionar')])[3]
#         Visivel    //p[contains(.,'BANCO RABOBANK INTERNACIONAL BRASIL S A')]
#     ELSE
#     IF    "${ACESS}"=="BRL Trust"
#         ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'BRL TRUST SERVICOS FIDUCIARIOS E PARTICIPACOES LTDA')]
#         IF    "${CHECK}"=="True"
#             Return From Keyword
#         END
#         Sleep    2s
#         Wait And Click    //div[contains(@class,'user-container MuiBox-root css-1mv69se')]
#         Wait And Click    //li[contains(.,'Meus acessos')]
#         Visivel    (//button[contains(.,'Selecionar')])[4]
#         Scroll Element Into View    (//button[contains(.,'Selecionar')])[4]
#         Wait And Click    (//button[contains(.,'Selecionar')])[4]
#         Visivel    //p[contains(.,'BRL TRUST SERVICOS FIDUCIARIOS E PARTICIPACOES LTDA')]
#     ELSE
#     IF    "${ACESS}"=="BTG"
#         ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'BTG PACTUAL WM GESTAO DE RECURSOS LTDA')]
#         IF    "${CHECK}"=="True"
#             Return From Keyword
#         END
#         Sleep    2s
#         Wait And Click    //div[contains(@class,'user-container MuiBox-root css-1mv69se')]
#         Wait And Click    //li[contains(.,'Meus acessos')]
#         Visivel    (//button[contains(.,'Selecionar')])[5]
#         Scroll Element Into View    (//button[contains(.,'Selecionar')])[5]
#         Wait And Click    (//button[contains(.,'Selecionar')])[5]
#         Visivel    //p[contains(.,'BTG PACTUAL WM GESTAO DE RECURSOS LTDA')]
#     ELSE
#     IF    "${ACESS}"=="Kamaroopin"
#         ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'KAMAROOPIN GESTORA DE RECURSOS LTDA.')]
#         IF    "${CHECK}"=="True"
#             Return From Keyword
#         END
#         Sleep    2s
#         Wait And Click    //div[contains(@class,'user-container MuiBox-root css-1mv69se')]
#         Wait And Click    //li[contains(.,'Meus acessos')]
#         Visivel    (//button[contains(.,'Selecionar')])[6]
#         Scroll Element Into View    (//button[contains(.,'Selecionar')])[6]
#         Wait And Click    (//button[contains(.,'Selecionar')])[6]
#         Visivel    //p[contains(.,'KAMAROOPIN GESTORA DE RECURSOS LTDA.')]
#     ELSE
#     IF    "${ACESS}"=="Kilima"
#         ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'KILIMA GESTAO DE RECURSOS LTDA')]
#         IF    "${CHECK}"=="True"
#             Return From Keyword
#         END
#         Sleep    2s
#         Wait And Click    //div[contains(@class,'user-container MuiBox-root css-1mv69se')]
#         Wait And Click    //li[contains(.,'Meus acessos')]
#         Visivel    (//button[contains(.,'Selecionar')])[7]
#         Scroll Element Into View    (//button[contains(.,'Selecionar')])[7]
#         Wait And Click    (//button[contains(.,'Selecionar')])[7]
#         Visivel    //p[contains(.,'KILIMA GESTAO DE RECURSOS LTDA')]
#     ELSE
#     IF    "${ACESS}"=="Unicred"
#         ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'UNICRED NATAL')]
#         IF    "${CHECK}"=="True"
#             Return From Keyword
#         END
#         Sleep    2s
#         Wait And Click    //div[contains(@class,'user-container MuiBox-root css-1mv69se')]
#         Wait And Click    //li[contains(.,'Meus acessos')]
#         Visivel    (//button[contains(.,'Selecionar')])[8]
#         Scroll Element Into View    (//button[contains(.,'Selecionar')])[8]
#         Wait And Click    (//button[contains(.,'Selecionar')])[8]
#         Visivel    //p[contains(.,'UNICRED NATAL')]
#     ELSE
#     IF    "${ACESS}"=="Upon"
#         ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'UPON GESTORA DE RECURSOS MACRO LTDA')]
#         IF    "${CHECK}"=="True"
#             Return From Keyword
#         END
#         Sleep    2s
#         Wait And Click    //div[contains(@class,'user-container MuiBox-root css-1mv69se')]
#         Wait And Click    //li[contains(.,'Meus acessos')]
#         Visivel    (//button[contains(.,'Selecionar')])[9]
#         Scroll Element Into View    (//button[contains(.,'Selecionar')])[9]
#         Wait And Click    (//button[contains(.,'Selecionar')])[9]
#         Visivel    //p[contains(.,'UPON GESTORA DE RECURSOS MACRO LTDA')]
#     END
#     END
#     END
#     END
#     END
#     END
#     END
#     END

 
Selecionar acesso para rentabilidade

    [Arguments]    ${ACESS}
    [Documentation]    O acesso pode ser: ITAU, BTG, BEM, BB, CAIXA, BRL, MERCANTIL
    Sleep    2s
    IF    "${ACESS}"=="ITAU" 
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'ITAU UNIBANCO SA')]
        IF    "${CHECK}"=="True"
        Return From Keyword
        END
    ELSE
    IF    "${ACESS}"=="BTG" 
        Sleep    4s
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'BTG PACTUAL SERVICOS FINANCEIROS SA DTVM')]
        IF    "${CHECK}"=="True"
        Return From Keyword
        END
    ELSE
    IF    "${ACESS}"=="BEM"
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'BEM DTVM')]
        IF    "${CHECK}"=="True"
        Return From Keyword
        END
    ELSE
    IF    "${ACESS}"=="BB" 
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'BB ASSET MANAGEMENT')]
        IF    "${CHECK}"=="True"
        Return From Keyword
        END
    ELSE
    IF    "${ACESS}"=="CAIXA" 
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'CAIXA')]
        IF    "${CHECK}"=="True"
        Return From Keyword
        END
    ELSE
    IF    "${ACESS}"=="BRL" 
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'BRL DTVM')]
        IF    "${CHECK}"=="True"
        Return From Keyword
        END
    END
    IF    "${ACESS}"=="MERCANTIL" 
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'MERCANTIL DO BRASIL DTVM')]
        IF    "${CHECK}"=="True"
        Return From Keyword
        END
    END
    END
    END
    END
    END
    END



    ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'Sysadmin')]
    IF    "${CHECK}"=="False"
        Sleep    2s
        Wait And Click    //div[contains(@class,'user-container MuiBox-root css-1mv69se')]
        Wait And Click    //li[contains(.,'Meus acessos')]
        #Setando SysAdmin para começar os testes
        Wait And Click    (//button[contains(.,'Selecionar')])[1]
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'Sysadmin')]
        IF    "${CHECK}"=="False"
            Sleep    2s
            Wait And Click    //div[contains(@class,'user-container MuiBox-root css-1mv69se')]
            Wait And Click    //li[contains(.,'Meus acessos')]
            #Setando SysAdmin para começar os testes, caso não tenha sido selecionado ainda
            Wait And Click    (//button[contains(.,'Selecionar')])[1]
            Visivel    //p[contains(.,'Sysadmin')]
        END
    END
    IF    "${ACESS}"=="ITAU"
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'ITAU UNIBANCO SA')]
        IF    "${CHECK}"=="True"
            Return From Keyword
        END
        Sleep    2s
        Wait And Click    //div[contains(@class,'user-container MuiBox-root css-1mv69se')]
        Wait And Click    //li[contains(.,'Meus acessos')]
        Visivel    (//button[contains(.,'Selecionar')])[2]
        Scroll Element Into View    (//button[contains(.,'Selecionar')])[2]
        Wait And Click    (//button[contains(.,'Selecionar')])[2]
        Visivel    //p[contains(.,'ITAU UNIBANCO SA')]
    ELSE
    IF    "${ACESS}"=="BTG"
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'BTG PACTUAL SERVICOS FINANCEIROS SA DTVM')]
        IF    "${CHECK}"=="True"
            Return From Keyword
        END
        Sleep    2s
        Wait And Click    //div[contains(@class,'user-container MuiBox-root css-1mv69se')]
        Wait And Click    //li[contains(.,'Meus acessos')]
        Visivel    (//button[contains(.,'Selecionar')])[3]
        Scroll Element Into View    (//button[contains(.,'Selecionar')])[3]
        Wait And Click    (//button[contains(.,'Selecionar')])[3]
        Visivel    //p[contains(.,'BTG PACTUAL SERVICOS FINANCEIROS SA DTVM')]
    ELSE
    IF    "${ACESS}"=="BEM"
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'BEM DTVM')]
        IF    "${CHECK}"=="True"
            Return From Keyword
        END
        Sleep    2s
        Wait And Click    //div[contains(@class,'user-container MuiBox-root css-1mv69se')]
        Wait And Click    //li[contains(.,'Meus acessos')]
        Visivel    (//button[contains(.,'Selecionar')])[4]
        Scroll Element Into View    (//button[contains(.,'Selecionar')])[4]
        Wait And Click    (//button[contains(.,'Selecionar')])[4]
        Visivel    //p[contains(.,'BEM DTVM')]
    ELSE
    IF    "${ACESS}"=="BB"
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'BB ASSET MANAGEMENT')]
        IF    "${CHECK}"=="True"
            Return From Keyword
        END
        Sleep    2s
        Wait And Click    //div[contains(@class,'user-container MuiBox-root css-1mv69se')]
        Wait And Click    //li[contains(.,'Meus acessos')]
        Visivel    (//button[contains(.,'Selecionar')])[5]
        Scroll Element Into View    (//button[contains(.,'Selecionar')])[5]
        Wait And Click    (//button[contains(.,'Selecionar')])[5]
        Visivel    //p[contains(.,'BB ASSET MANAGEMENT')]
    ELSE
    IF    "${ACESS}"=="CAIXA"
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'CAIXA')]
        IF    "${CHECK}"=="True"
            Return From Keyword
        END
        Sleep    2s
        Wait And Click    //div[contains(@class,'user-container MuiBox-root css-1mv69se')]
        Wait And Click    //li[contains(.,'Meus acessos')]
        Visivel    (//button[contains(.,'Selecionar')])[6]
        Scroll Element Into View    (//button[contains(.,'Selecionar')])[6]
        Wait And Click    (//button[contains(.,'Selecionar')])[6]
        Visivel    //p[contains(.,'CAIXA')]
    ELSE
    IF    "${ACESS}"=="BRL"
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'BRL DTVM')]
        IF    "${CHECK}"=="True"
            Return From Keyword
        END
        Sleep    2s
        Wait And Click    //div[contains(@class,'user-container MuiBox-root css-1mv69se')]
        Wait And Click    //li[contains(.,'Meus acessos')]
        Visivel    (//button[contains(.,'Selecionar')])[7]
        Scroll Element Into View    (//button[contains(.,'Selecionar')])[7]
        Wait And Click    (//button[contains(.,'Selecionar')])[7]
        Visivel    //p[contains(.,'BRL DTVM')]
    END
    IF    "${ACESS}"=="MERCANTIL"
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'MERCANTIL DO BRASIL DTVM')]
        IF    "${CHECK}"=="True"
            Return From Keyword
        END
        Sleep    2s
        Wait And Click    //div[contains(@class,'user-container MuiBox-root css-1mv69se')]
        Wait And Click    //li[contains(.,'Meus acessos')]
        Visivel    (//button[contains(.,'Selecionar')])[7]
        Scroll Element Into View    (//button[contains(.,'Selecionar')])[7]
        Wait And Click    (//button[contains(.,'Selecionar')])[7]
        Visivel    //p[contains(.,'MERCANTIL DO BRASIL DTVM')]
    END
    END
    END
    END
    END
    END

Selecionar acesso para Administrador

    [Arguments]    ${ACESS}
    [Documentation]    O acesso pode ser: ITAU, BTG, BEM, BB, CAIXA, BRL, MERCANTIL
    Sleep    2s
    IF    "${ACESS}"=="ITAU" 
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'ITAU UNIBANCO SA')]
        IF    "${CHECK}"=="True"
        Return From Keyword
        END
    ELSE
    IF    "${ACESS}"=="BTG" 
        Sleep    4s
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'BTG PACTUAL SERVICOS FINANCEIROS SA DTVM')]
        IF    "${CHECK}"=="True"
        Return From Keyword
        END
    ELSE
    IF    "${ACESS}"=="BEM"
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'BEM DTVM')]
        IF    "${CHECK}"=="True"
        Return From Keyword
        END
    ELSE
    IF    "${ACESS}"=="BB" 
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'BB ASSET MANAGEMENT')]
        IF    "${CHECK}"=="True"
        Return From Keyword
        END
    ELSE
    IF    "${ACESS}"=="CAIXA" 
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'CAIXA')]
        IF    "${CHECK}"=="True"
        Return From Keyword
        END
    ELSE
    IF    "${ACESS}"=="BRL" 
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'BRL DTVM')]
        IF    "${CHECK}"=="True"
        Return From Keyword
        END
    END
    IF    "${ACESS}"=="MERCANTIL" 
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'MERCANTIL DO BRASIL DTVM')]
        IF    "${CHECK}"=="True"
        Return From Keyword
        END
    END
    END
    END
    END
    END
    END



    ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'Sysadmin')]
    IF    "${CHECK}"=="False"
        Sleep    2s
        Wait And Click    //div[contains(@class,'user-container MuiBox-root css-1mv69se')]
        Wait And Click    //li[contains(.,'Meus acessos')]
        #Setando SysAdmin para começar os testes
        Wait And Click    (//button[contains(.,'Selecionar')])[1]
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'Sysadmin')]
        IF    "${CHECK}"=="False"
            Sleep    2s
            Wait And Click    //div[contains(@class,'user-container MuiBox-root css-1mv69se')]
            Wait And Click    //li[contains(.,'Meus acessos')]
            #Setando SysAdmin para começar os testes, caso não tenha sido selecionado ainda
            Wait And Click    (//button[contains(.,'Selecionar')])[1]
            Visivel    //p[contains(.,'Sysadmin')]
        END
    END
    IF    "${ACESS}"=="ITAU"
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'ITAU UNIBANCO SA')]
        IF    "${CHECK}"=="True"
            Return From Keyword
        END
        Sleep    2s
        Wait And Click    //div[contains(@class,'user-container MuiBox-root css-1mv69se')]
        Wait And Click    //li[contains(.,'Meus acessos')]
        Visivel    (//button[contains(.,'Selecionar')])[2]
        Scroll Element Into View    (//button[contains(.,'Selecionar')])[2]
        Wait And Click    (//button[contains(.,'Selecionar')])[2]
        Visivel    //p[contains(.,'ITAU UNIBANCO SA')]
    ELSE
    IF    "${ACESS}"=="BTG"
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'BTG PACTUAL SERVICOS FINANCEIROS SA DTVM')]
        IF    "${CHECK}"=="True"
            Return From Keyword
        END
        Sleep    2s
        Wait And Click    //div[contains(@class,'user-container MuiBox-root css-1mv69se')]
        Wait And Click    //li[contains(.,'Meus acessos')]
        Visivel    (//button[contains(.,'Selecionar')])[3]
        Scroll Element Into View    (//button[contains(.,'Selecionar')])[3]
        Wait And Click    (//button[contains(.,'Selecionar')])[3]
        Visivel    //p[contains(.,'BTG PACTUAL SERVICOS FINANCEIROS SA DTVM')]
    ELSE
    IF    "${ACESS}"=="BEM"
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'BEM DTVM')]
        IF    "${CHECK}"=="True"
            Return From Keyword
        END
        Sleep    2s
        Wait And Click    //div[contains(@class,'user-container MuiBox-root css-1mv69se')]
        Wait And Click    //li[contains(.,'Meus acessos')]
        Visivel    (//button[contains(.,'Selecionar')])[4]
        Scroll Element Into View    (//button[contains(.,'Selecionar')])[4]
        Wait And Click    (//button[contains(.,'Selecionar')])[4]
        Visivel    //p[contains(.,'BEM DTVM')]
    ELSE
    IF    "${ACESS}"=="BB"
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'BB ASSET MANAGEMENT')]
        IF    "${CHECK}"=="True"
            Return From Keyword
        END
        Sleep    2s
        Wait And Click    //div[contains(@class,'user-container MuiBox-root css-1mv69se')]
        Wait And Click    //li[contains(.,'Meus acessos')]
        Visivel    (//button[contains(.,'Selecionar')])[5]
        Scroll Element Into View    (//button[contains(.,'Selecionar')])[5]
        Wait And Click    (//button[contains(.,'Selecionar')])[5]
        Visivel    //p[contains(.,'BB ASSET MANAGEMENT')]
    ELSE
    IF    "${ACESS}"=="CAIXA"
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'CAIXA')]
        IF    "${CHECK}"=="True"
            Return From Keyword
        END
        Sleep    2s
        Wait And Click    //div[contains(@class,'user-container MuiBox-root css-1mv69se')]
        Wait And Click    //li[contains(.,'Meus acessos')]
        Visivel    (//button[contains(.,'Selecionar')])[6]
        Scroll Element Into View    (//button[contains(.,'Selecionar')])[6]
        Wait And Click    (//button[contains(.,'Selecionar')])[6]
        Visivel    //p[contains(.,'CAIXA')]
    ELSE
    IF    "${ACESS}"=="BRL"
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'BRL DTVM')]
        IF    "${CHECK}"=="True"
            Return From Keyword
        END
        Sleep    2s
        Wait And Click    //div[contains(@class,'user-container MuiBox-root css-1mv69se')]
        Wait And Click    //li[contains(.,'Meus acessos')]
        Visivel    (//button[contains(.,'Selecionar')])[7]
        Scroll Element Into View    (//button[contains(.,'Selecionar')])[7]
        Wait And Click    (//button[contains(.,'Selecionar')])[7]
        Visivel    //p[contains(.,'BRL DTVM')]
    END
    IF    "${ACESS}"=="MERCANTIL"
        ${CHECK}    Run Keyword And Return Status    Visivel    //p[contains(.,'MERCANTIL DO BRASIL DTVM')]
        IF    "${CHECK}"=="True"
            Return From Keyword
        END
        Sleep    2s
        Wait And Click    //div[contains(@class,'user-container MuiBox-root css-1mv69se')]
        Wait And Click    //li[contains(.,'Meus acessos')]
        Visivel    (//button[contains(.,'Selecionar')])[7]
        Scroll Element Into View    (//button[contains(.,'Selecionar')])[7]
        Wait And Click    (//button[contains(.,'Selecionar')])[7]
        Visivel    //p[contains(.,'MERCANTIL DO BRASIL DTVM')]
    END
    END
    END
    END
    END
    END

Random Number
    [Arguments]    ${SIZE}
    ${RND_NUM}=    Generate Random String    length=${SIZE}    chars=[NUMBERS]
    ${RND_NUM}=    Convert To Integer    ${RND_NUM}
    Return From Keyword    ${RND_NUM}

Main Menu 
    Wait And Click    //a[@class='css-zguoul'][contains(.,'Início')]

Focus 
    [Arguments]    ${ELEMENT}
    SeleniumLibrary.Wait Until Element Is Visible    ${ELEMENT}
    Scroll Element Into View    ${ELEMENT}

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

Get Informe Number
    [Documentation]    #Keyword que armazena na variável ${PLC_NUM} o numero do informe que é exibido no popup após submeter
    Visivel    //p[contains(.,'Solicitação')]    15		#Visivel    //p[@class='MuiTypography-root MuiTypography-body2 css-zetry8'][contains(.,'Solicitação')]    15
    ${PLC_NUM}    SeleniumLibrary.Get Text    //p[contains(.,'Solicitação')]		#${PLC_NUM}    SeleniumLibrary.Get Text    //p[@class='MuiTypography-root MuiTypography-body2 css-zetry8'][contains(.,'Solicitação')]
    Log    ${PLC_NUM}
    ${PLC_NUM}=    Remove String    ${PLC_NUM}    Solicitação      criada com sucesso.
    Log    ${PLC_NUM.strip()}
    ${PLC_NUM}    Set Variable    ${PLC_NUM.strip()}
    Set Global Variable    ${PLC_NUM}
    SeleniumLibrary.Wait Until Element Is Not Visible    locator=//p[contains(.,'Solicitação')]    timeout=10s

Get Register Number
    [Documentation]    #Keyword que armazena na variável ${PLC_NUM} o numero do informe que é exibido no popup após submeter
    Visivel    //p[contains(.,'Solicitação')]    15
    ${REG_NUM}    SeleniumLibrary.Get Text    //p[contains(.,'Solicitação')]
    Log    ${REG_NUM}
    ${REG_NUM}=    Remove String    ${REG_NUM}    Solicitação de registro    submetido a análise.
    Log    ${REG_NUM.strip()}
    ${REG_NUM}    Set Variable    ${REG_NUM.strip()}
    Set Global Variable    ${REG_NUM}
    ${X}    Run Keyword And Return Status    Visivel    //svg[contains(@class,'MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-qf3nq')]
    IF    "${X}"=="True"
        # Wait And Click    //svg[@data-testid='CloseOutlinedIcon']
        Wait And Click    //svg[contains(@class,'MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-qf3nq')]
    END

Get File Informe Number
    [Documentation]    #Keyword que armazena na variável ${PLC_NUM} o numero do informe que é exibido no popup após submeter
    Visivel    //p[contains(.,'registrada com sucesso!')]    15		#Visivel    //p[@class='MuiTypography-root MuiTypography-body2 css-zetry8'][contains(.,'Solicitação')]    15
    ${PLC_NUM}    SeleniumLibrary.Get Text    //p[contains(.,'registrada com sucesso!')]		#${PLC_NUM}    SeleniumLibrary.Get Text    //p[@class='MuiTypography-root MuiTypography-body2 css-zetry8'][contains(.,'Solicitação')]
    Log    ${PLC_NUM}
    ${PLC_NUM}=    Remove String    ${PLC_NUM}    Solicitação      registrada com sucesso!
    Log    ${PLC_NUM.strip()}
    ${PLC_NUM}    Set Variable    ${PLC_NUM.strip()}
    Set Global Variable    ${PLC_NUM}

Preencher restante do perfil da classe
    Combo    //div[contains(@aria-labelledby,'composicaoFundo')]    //li[contains(.,'FI')]
    Combo    //div[contains(@aria-labelledby,'tributacaoPerseguida')]    //li[contains(.,'Renda Variável')]
    Combo    //div[contains(@aria-labelledby,'fundoAlavancado')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'multiGestor')]    //li[contains(.,'Multigestor')]
    Combo    //div[contains(@aria-labelledby,'derivativos')]    //li[contains(.,'Permitido')]
    Combo    //div[contains(@aria-labelledby,'possuiBenchmark')]    //li[contains(.,'Sim')]    
    #Combo    //div[contains(@aria-labelledby,'benchmark')]    //li[contains(.,'EURO')]
    Wait And Click    //div[contains(@aria-labelledby,'benchmark')]
    Scroll Element Into View    //li[contains(.,'EURO')]
    SeleniumLibrary.Click Element    //li[contains(.,'EURO')]

    Combo    //div[contains(@aria-labelledby,'creditoPrivado')]    //li[contains(.,'Não')]
    Wait And Input    //input[contains(@name,'percentualCreditoPrivado')]    10
    Combo    //div[contains(@aria-labelledby,'investimentosExterior')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'indicadorLimitesPorEmissorAtivo')]    //li[contains(.,'Não se aplica')]  
    Combo    //div[contains(@aria-labelledby,'focoAtuacao')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'fundoEsg')]    //li[contains(.,'Não')]
    Sleep    1s
    Combo    //div[contains(@aria-labelledby,'formaCondominio')]    //li[contains(.,'Aberto')]
    Combo    //div[contains(@aria-labelledby,'indicadorFundoInfraestrutura')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'criptoativosMaiorRiscoDaCarteira')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'prazoDuracao')]    //li[contains(.,'Indeterminado')]
    Combo    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]    //li[contains(.,'Não')]

Preencher restante do perfil da classe no exterior
    Combo    //div[contains(@aria-labelledby,'composicaoFundo')]    //li[contains(.,'FI')]
    Combo    //div[contains(@aria-labelledby,'tributacaoPerseguida')]    //li[contains(.,'Renda Variável')]
    Combo    //div[contains(@aria-labelledby,'fundoAlavancado')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'multiGestor')]    //li[contains(.,'Multigestor')]
    Combo    //div[contains(@aria-labelledby,'derivativos')]    //li[contains(.,'Permitido')]
    Combo    //div[contains(@aria-labelledby,'possuiBenchmark')]    //li[contains(.,'Sim')] 
    Sleep    2s   
    #Combo    //div[contains(@aria-labelledby,'benchmark')]    //li[contains(.,'EURO')]
    Wait And Click    //div[contains(@aria-labelledby,'benchmark')]
    Scroll Element Into View    //li[contains(.,'EURO')]
    SeleniumLibrary.Click Element    //li[contains(.,'EURO')]

    Combo    //div[contains(@aria-labelledby,'creditoPrivado')]    //li[contains(.,'Não')]
    Wait And Input    //input[contains(@name,'percentualCreditoPrivado')]    50
    #Combo    //div[contains(@aria-labelledby,'investimentosExterior')]    //li[contains(.,'Até 100%')]
    Wait And Click    //div[contains(@aria-labelledby,'investimentosExterior')]
    Scroll Element Into View    //li[contains(.,'Até 100%')]
    SeleniumLibrary.Click Element    //li[contains(.,'Até 100%')]
    Wait And Input    //input[contains(@name,'percentualAutorizadoInvestimentoExterior')]    50
    Combo    //div[contains(@aria-labelledby,'indicadorLimitesPorEmissorAtivo')]    //li[contains(.,'Não se aplica')] 
    Combo    //div[contains(@aria-labelledby,'focoAtuacao')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'fundoEsg')]    //li[contains(.,'Não')]
    Sleep    1s
    Combo    //div[contains(@aria-labelledby,'formaCondominio')]    //li[contains(.,'Aberto')]
    Combo    //div[contains(@aria-labelledby,'indicadorFundoInfraestrutura')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'criptoativosMaiorRiscoDaCarteira')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'prazoDuracao')]    //li[contains(.,'Indeterminado')]
    Combo    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]    //li[contains(.,'Não')]

Preencher restante do perfil da classe no exterior V13
    Combo    //div[contains(@aria-labelledby,'composicaoFundo')]    //li[contains(.,'CI')]
    #Combo    //div[contains(@aria-labelledby,'tributacaoPerseguida')]    //li[contains(.,'Alícota de 15%')]
    Combo    //div[contains(@aria-labelledby,'fundoAlavancado')]    //li[contains(.,'Não')]
    # Combo    //div[contains(@aria-labelledby,'multiGestor')]    //li[contains(.,'Multigestor')]
    Combo    //div[contains(@aria-labelledby,'derivativos')]    //li[contains(.,'Permitido')]
    Combo    //div[contains(@aria-labelledby,'possuiBenchmark')]    //li[contains(.,'Sim')] 
    Sleep    2s
    Wait And Click    //div[contains(@aria-labelledby,'benchmark')]            #opções disponíveis (CDI /CDI 30X30 / DÓLAR COMERCIAL/ DÓLAR PTAX/ EURO)
    Scroll Element Into View    //p[contains(.,'EURO')]
    SeleniumLibrary.Click Element    //p[contains(.,'EURO')]
    SeleniumLibrary.Press Keys    None    TAB
    # Wait And Click    //div[contains(@aria-labelledby,'benchmark')]
    #Combo    //div[contains(@aria-labelledby,'creditoPrivado')]    //li[contains(.,'Não')]
    Wait And Input    //input[contains(@name,'percentualCreditoPrivado')]    50
    Combo    //div[contains(@aria-labelledby,'investimentosExterior')]    //li[contains(.,'Até 40%')]
    Wait And Click    //div[contains(@aria-labelledby,'investimentosExterior')]
    Scroll Element Into View    //li[contains(.,'Até 40%')]
    SeleniumLibrary.Click Element    //li[contains(.,'Até 40%')]
    Wait And Input    //input[contains(@name,'percentualAutorizadoInvestimentoExterior')]    50
    Combo    //div[contains(@aria-labelledby,'indicadorLimitesPorEmissorAtivo')]    //li[contains(.,'Não se aplica')] 
    #Combo    //div[contains(@aria-labelledby,'focoAtuacao')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'fundoEsg')]    //li[contains(.,'Não')]
    Sleep    1s
    Combo    //div[contains(@aria-labelledby,'formaCondominio')]    //li[contains(.,'Fechado')]
    # Combo    //div[contains(@aria-labelledby,'indicadorFundoInfraestrutura')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'criptoativosMaiorRiscoDaCarteira')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'prazoDuracao')]    //li[contains(.,'Indeterminado')]
    Combo    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]    //li[contains(.,'Não')]
    Combo    //div[@aria-labelledby='fundosIsentosComeCotas']    //li[contains(.,'Sim')]


Preencher restante do perfil da classe com alteração no exterior V13
    Combo    //div[contains(@aria-labelledby,'composicaoFundo')]    //li[contains(.,'CI')]
    #Combo    //div[contains(@aria-labelledby,'tributacaoPerseguida')]    //li[contains(.,'Alícota de 15%')]
    Combo    //div[contains(@aria-labelledby,'fundoAlavancado')]    //li[contains(.,'Não')]
    # Combo    //div[contains(@aria-labelledby,'multiGestor')]    //li[contains(.,'Multigestor')]
    Combo    //div[contains(@aria-labelledby,'derivativos')]    //li[contains(.,'Permitido')]
    Combo    //div[contains(@aria-labelledby,'possuiBenchmark')]    //li[contains(.,'Sim')] 
    Sleep    2s
    Wait And Click    //div[contains(@aria-labelledby,'benchmark')]            #opções disponíveis (CDI /CDI 30X30 / DÓLAR COMERCIAL/ DÓLAR PTAX/ EURO)
    Scroll Element Into View    //p[contains(.,'EURO')]
    SeleniumLibrary.Click Element    //p[contains(.,'EURO')]
    SeleniumLibrary.Press Keys    None    TAB
    # Wait And Click    //div[contains(@aria-labelledby,'benchmark')]
    #Combo    //div[contains(@aria-labelledby,'creditoPrivado')]    //li[contains(.,'Não')]
    Wait And Input    //input[contains(@name,'percentualCreditoPrivado')]    50
    Combo    //div[contains(@aria-labelledby,'investimentosExterior')]    //li[contains(.,'Até 40%')]
    Wait And Click    //div[contains(@aria-labelledby,'investimentosExterior')]
    Scroll Element Into View    //li[contains(.,'Até 40%')]
    SeleniumLibrary.Click Element    //li[contains(.,'Até 40%')]
    Wait And Input    //input[contains(@name,'percentualAutorizadoInvestimentoExterior')]    50
    Combo    //div[contains(@aria-labelledby,'indicadorLimitesPorEmissorAtivo')]    //li[contains(.,'Não se aplica')] 
    #Combo    //div[contains(@aria-labelledby,'focoAtuacao')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'fundoEsg')]    //li[contains(.,'Não')]
    Sleep    1s
    Combo    //div[contains(@aria-labelledby,'formaCondominio')]    //li[contains(.,'Aberto')]
    # Combo    //div[contains(@aria-labelledby,'indicadorFundoInfraestrutura')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'criptoativosMaiorRiscoDaCarteira')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'prazoDuracao')]    //li[contains(.,'Indeterminado')]
    Combo    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]    //li[contains(.,'Não')]
    Combo    //div[@aria-labelledby='fundosIsentosComeCotas']    //li[contains(.,'Sim')]


Preencher restante do perfil da classe Previdencia V13 
    Combo    //div[contains(@aria-labelledby,'composicaoFundo')]    //li[contains(.,'CI')]
    #Combo    //div[contains(@aria-labelledby,'tributacaoPerseguida')]    //li[contains(.,'Previdenciário')]
    Combo    //div[contains(@aria-labelledby,'fundoAlavancado')]    //li[contains(.,'Não')]
    # Combo    //div[contains(@aria-labelledby,'multiGestor')]    //li[contains(.,'Multigestor')]
    Combo    //div[contains(@aria-labelledby,'derivativos')]    //li[contains(.,'Permitido')]
    Combo    //div[contains(@aria-labelledby,'possuiBenchmark')]    //li[contains(.,'Sim')] 
    Sleep    2s
    Wait And Click    //div[contains(@aria-labelledby,'benchmark')]            #opções disponíveis (CDI /CDI 30X30 / DÓLAR COMERCIAL/ DÓLAR PTAX/ EURO)
    Scroll Element Into View    //p[contains(.,'EURO')]
    SeleniumLibrary.Click Element    //p[contains(.,'EURO')]
    SeleniumLibrary.Press Keys    None    TAB
    # Wait And Click    //div[contains(@aria-labelledby,'benchmark')]
    #Combo    //div[contains(@aria-labelledby,'creditoPrivado')]    //li[contains(.,'Não')]
    Wait And Input    //input[contains(@name,'percentualCreditoPrivado')]    40
    #Combo    //div[contains(@aria-labelledby,'investimentosExterior')]    //li[contains(.,'Até 40%')]
    Sleep    2s
    Wait And Click    //div[@aria-labelledby='investimentosExterior']
    Scroll Element Into View    //li[contains(.,'Até 40%')]
    SeleniumLibrary.Click Element    //li[contains(.,'Até 40%')]
    Wait And Input    //input[contains(@name,'percentualAutorizadoInvestimentoExterior')]    40
    Combo    //div[contains(@aria-labelledby,'indicadorLimitesPorEmissorAtivo')]    //li[contains(.,'Não se aplica')] 
    #Combo    //div[contains(@aria-labelledby,'focoAtuacao')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'fundoEsg')]    //li[contains(.,'Não')]
    Sleep    1s
    Combo    //div[contains(@aria-labelledby,'formaCondominio')]    //li[contains(.,'Aberto')]
    # Combo    //div[contains(@aria-labelledby,'indicadorFundoInfraestrutura')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'criptoativosMaiorRiscoDaCarteira')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'prazoDuracao')]    //li[contains(.,'Indeterminado')]
    Combo    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]    //li[contains(.,'Sim')]
    Combo    //div[@aria-labelledby='fundosIsentosComeCotas']    //li[contains(.,'Sim')]

Preencher restante do perfil da classe RF Previdencia V13
    Combo    //div[contains(@aria-labelledby,'composicaoFundo')]    //li[contains(.,'CIC')]
    #Combo    //div[contains(@aria-labelledby,'tributacaoPerseguida')]    //li[contains(.,'Previdenciário')]
    Combo    //div[contains(@aria-labelledby,'fundoAlavancado')]    //li[contains(.,'Não')]
    # Combo    //div[contains(@aria-labelledby,'multiGestor')]    //li[contains(.,'Multigestor')]
    Combo    //div[contains(@aria-labelledby,'derivativos')]    //li[contains(.,'Permitido')]
    Combo    //div[contains(@aria-labelledby,'possuiBenchmark')]    //li[contains(.,'Sim')] 
    Sleep    2s
    Wait And Click    //div[contains(@aria-labelledby,'benchmark')]            #opções disponíveis (CDI /CDI 30X30 / DÓLAR COMERCIAL/ DÓLAR PTAX/ EURO)
    Scroll Element Into View    //p[contains(.,'EURO')]
    SeleniumLibrary.Click Element    //p[contains(.,'EURO')]
    SeleniumLibrary.Press Keys    None    TAB
    # Wait And Click    //div[contains(@aria-labelledby,'benchmark')]
    Combo    //div[contains(@aria-labelledby,'creditoPrivado')]    //li[contains(.,'Sim')]
    Wait And Input    //input[contains(@name,'percentualCreditoPrivado')]    60
    Combo    //div[contains(@aria-labelledby,'investimentosExterior')]    //li[contains(.,'Até 40%')]
    Wait And Click    //div[contains(@aria-labelledby,'investimentosExterior')]
    Scroll Element Into View    //li[contains(.,'Até 40%')]
    SeleniumLibrary.Click Element    //li[contains(.,'Até 40%')]
    Wait And Input    //input[contains(@name,'percentualAutorizadoInvestimentoExterior')]    60
    Combo    //div[contains(@aria-labelledby,'indicadorLimitesPorEmissorAtivo')]    //li[contains(.,'Não se aplica')] 
    #Combo    //div[contains(@aria-labelledby,'focoAtuacao')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'fundoEsg')]    //li[contains(.,'Não')]
    Sleep    1s
    Combo    //div[contains(@aria-labelledby,'formaCondominio')]    //li[contains(.,'Aberto')]
    Combo    //div[contains(@aria-labelledby,'indicadorFundoInfraestrutura')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'criptoativosMaiorRiscoDaCarteira')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'prazoDuracao')]    //li[contains(.,'Indeterminado')]
    Combo    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]    //li[contains(.,'Sim')]
    Combo    //div[@aria-labelledby='fundosIsentosComeCotas']    //li[contains(.,'Sim')]

Preencher restante do perfil da classe acoes no exterior V13
    Combo    //div[contains(@aria-labelledby,'composicaoFundo')]    //li[contains(.,'CI')]
    Combo    //div[contains(@aria-labelledby,'tributacaoPerseguida')]    //li[contains(.,'Alícota de 15%')]
    # Combo    //div[contains(@aria-labelledby,'fundoAlavancado')]    //li[contains(.,'Não')]
    # Combo    //div[contains(@aria-labelledby,'multiGestor')]    //li[contains(.,'Multigestor')]
    Combo    //div[contains(@aria-labelledby,'derivativos')]    //li[contains(.,'Permitido')]
    Combo    //div[contains(@aria-labelledby,'possuiBenchmark')]    //li[contains(.,'Sim')] 
    Sleep    2s
    Wait And Click    //div[contains(@aria-labelledby,'benchmark')]            #opções disponíveis (CDI /CDI 30X30 / DÓLAR COMERCIAL/ DÓLAR PTAX/ EURO)
    Scroll Element Into View    //p[contains(.,'EURO')]
    SeleniumLibrary.Click Element    //p[contains(.,'EURO')]
    SeleniumLibrary.Press Keys    None    TAB
    # Wait And Click    //div[contains(@aria-labelledby,'benchmark')]
    Combo    //div[contains(@aria-labelledby,'creditoPrivado')]    //li[contains(.,'Não')]
    Wait And Input    //input[contains(@name,'percentualCreditoPrivado')]    50
    #Combo    //div[contains(@aria-labelledby,'investimentosExterior')]    //li[contains(.,'Até 100%')]
    Wait And Click    //div[contains(@aria-labelledby,'investimentosExterior')]
    Scroll Element Into View    //li[contains(.,'Até 40%')]
    SeleniumLibrary.Click Element    //li[contains(.,'Até 40%')]
    Wait And Input    //input[contains(@name,'percentualAutorizadoInvestimentoExterior')]    50
    Combo    //div[contains(@aria-labelledby,'indicadorLimitesPorEmissorAtivo')]    //li[contains(.,'Não se aplica')] 
    Combo    //div[contains(@aria-labelledby,'focoAtuacao')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'fundoEsg')]    //li[contains(.,'Não')]
    Sleep    1s
    Combo    //div[contains(@aria-labelledby,'formaCondominio')]    //li[contains(.,'Aberto')]
    # Combo    //div[contains(@aria-labelledby,'indicadorFundoInfraestrutura')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'criptoativosMaiorRiscoDaCarteira')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'prazoDuracao')]    //li[contains(.,'Indeterminado')]
    Combo    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]    //li[contains(.,'Não se aplica')]
    Combo    //div[@aria-labelledby='fundosIsentosComeCotas']    //li[contains(.,'Sim')]

Preencher restante do perfil da classe acoes investimento no exterior V13
    Combo    //div[contains(@aria-labelledby,'composicaoFundo')]    //li[contains(.,'CI')]
    #Combo    //div[contains(@aria-labelledby,'tributacaoPerseguida')]    //li[contains(.,'Alíquota de 15%')]
    Combo    //div[contains(@aria-labelledby,'fundoAlavancado')]    //li[contains(.,'Não')]
    # Combo    //div[contains(@aria-labelledby,'multiGestor')]    //li[contains(.,'Multigestor')]
    Combo    //div[contains(@aria-labelledby,'derivativos')]    //li[contains(.,'Permitido')]
    Combo    //div[contains(@aria-labelledby,'possuiBenchmark')]    //li[contains(.,'Sim')] 
    Sleep    2s
    Wait And Click    //div[contains(@aria-labelledby,'benchmark')]            #opções disponíveis (CDI /CDI 30X30 / DÓLAR COMERCIAL/ DÓLAR PTAX/ EURO)
    Scroll Element Into View    //p[contains(.,'EURO')]
    SeleniumLibrary.Click Element    //p[contains(.,'EURO')]
    SeleniumLibrary.Press Keys    None    TAB
    # Wait And Click    //div[contains(@aria-labelledby,'benchmark')]
    #Combo    //div[contains(@aria-labelledby,'creditoPrivado')]    //li[contains(.,'Não')]
    Wait And Input    //input[contains(@name,'percentualCreditoPrivado')]    50
    #Combo    //div[contains(@aria-labelledby,'investimentosExterior')]    //li[contains(.,'Até 100%')]
    # Wait And Click    //div[contains(@aria-labelledby,'investimentosExterior')]
    # Scroll Element Into View    //li[contains(.,'Até 40%')]
    # SeleniumLibrary.Click Element    //li[contains(.,'Até 40%')]
    Wait And Input    //input[contains(@name,'percentualAutorizadoInvestimentoExterior')]    50
    Combo    //div[contains(@aria-labelledby,'indicadorLimitesPorEmissorAtivo')]    //li[contains(.,'Não se aplica')] 
    Combo    //div[contains(@aria-labelledby,'focoAtuacao')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'fundoEsg')]    //li[contains(.,'Não')]
    Sleep    1s
    Combo    //div[contains(@aria-labelledby,'formaCondominio')]    //li[contains(.,'Aberto')]
    # Combo    //div[contains(@aria-labelledby,'indicadorFundoInfraestrutura')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'criptoativosMaiorRiscoDaCarteira')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'prazoDuracao')]    //li[contains(.,'Indeterminado')]
    Combo    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]    //li[contains(.,'Não')]
    Combo    //div[@aria-labelledby='fundosIsentosComeCotas']    //li[contains(.,'Sim')]

#Preencher restante do perfil da classe acoes investimento no exterior V13
#    Combo    //div[contains(@aria-labelledby,'composicaoFundo')]    //li[contains(.,'CI')]
#    Combo    //div[contains(@aria-labelledby,'tributacaoPerseguida')]    //li[contains(.,'Alíquota de 15%')]
#    Combo    //div[contains(@aria-labelledby,'fundoAlavancado')]    //li[contains(.,'Não')]
#    # Combo    //div[contains(@aria-labelledby,'multiGestor')]    //li[contains(.,'Multigestor')]
#    Combo    //div[contains(@aria-labelledby,'derivativos')]    //li[contains(.,'Permitido')]
#    Combo    //div[contains(@aria-labelledby,'possuiBenchmark')]    //li[contains(.,'Sim')] 
#    Sleep    2s
#    Wait And Click    //div[contains(@aria-labelledby,'benchmark')]            #opções disponíveis (CDI /CDI 30X30 / DÓLAR COMERCIAL/ DÓLAR PTAX/ EURO)
#    Scroll Element Into View    //p[contains(.,'EURO')]
#    SeleniumLibrary.Click Element    //p[contains(.,'EURO')]
#    SeleniumLibrary.Press Keys    None    TAB
#    # Wait And Click    //div[contains(@aria-labelledby,'benchmark')]
#    Combo    //div[contains(@aria-labelledby,'creditoPrivado')]    //li[contains(.,'Não')]
#    Wait And Input    //input[contains(@name,'percentualCreditoPrivado')]    50
#    #Combo    //div[contains(@aria-labelledby,'investimentosExterior')]    //li[contains(.,'Até 100%')]
#    # Wait And Click    //div[contains(@aria-labelledby,'investimentosExterior')]
#    # Scroll Element Into View    //li[contains(.,'Até 40%')]
#    # SeleniumLibrary.Click Element    //li[contains(.,'Até 40%')]
#    Wait And Input    //input[contains(@name,'percentualAutorizadoInvestimentoExterior')]    50
#    Combo    //div[contains(@aria-labelledby,'indicadorLimitesPorEmissorAtivo')]    //li[contains(.,'Não se aplica')] 
#    Combo    //div[contains(@aria-labelledby,'focoAtuacao')]    //li[contains(.,'Não se aplica')]
#    Combo    //div[contains(@aria-labelledby,'fundoEsg')]    //li[contains(.,'Não')]
#    Sleep    1s
#    Combo    //div[contains(@aria-labelledby,'formaCondominio')]    //li[contains(.,'Aberto')]
#    # Combo    //div[contains(@aria-labelledby,'indicadorFundoInfraestrutura')]    //li[contains(.,'Não se aplica')]
#    Combo    //div[contains(@aria-labelledby,'criptoativosMaiorRiscoDaCarteira')]    //li[contains(.,'Não')]
#    Combo    //div[contains(@aria-labelledby,'prazoDuracao')]    //li[contains(.,'Indeterminado')]
#    Combo    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]    //li[contains(.,'Não se aplica')]
#    Combo    //div[@aria-labelledby='fundosIsentosComeCotas']    //li[contains(.,'Sim')]

Preencher restante do perfil da classe acoes investimento no exterior Regra Ciclo2 V13
    Combo    //div[contains(@aria-labelledby,'composicaoFundo')]    //li[contains(.,'CI')]
    #Combo    //div[contains(@aria-labelledby,'tributacaoPerseguida')]    //li[contains(.,'Alíquota de 15%')]
    Combo    //div[contains(@aria-labelledby,'fundoAlavancado')]    //li[contains(.,'Não')]
    # Combo    //div[contains(@aria-labelledby,'multiGestor')]    //li[contains(.,'Multigestor')]
    Combo    //div[contains(@aria-labelledby,'derivativos')]    //li[contains(.,'Permitido')]
    Combo    //div[contains(@aria-labelledby,'possuiBenchmark')]    //li[contains(.,'Sim')] 
    Sleep    2s
    Wait And Click    //div[contains(@aria-labelledby,'benchmark')]            #opções disponíveis (CDI /CDI 30X30 / DÓLAR COMERCIAL/ DÓLAR PTAX/ EURO)
    Scroll Element Into View    //p[contains(.,'EURO')]
    SeleniumLibrary.Click Element    //p[contains(.,'EURO')]
    SeleniumLibrary.Press Keys    None    TAB
    # Wait And Click    //div[contains(@aria-labelledby,'benchmark')]
    #Combo    //div[contains(@aria-labelledby,'creditoPrivado')]    //li[contains(.,'Não')]
    Wait And Input    //input[contains(@name,'percentualCreditoPrivado')]    50
    #Combo    //div[contains(@aria-labelledby,'investimentosExterior')]    //li[contains(.,'Até 100%')]
    # Wait And Click    //div[contains(@aria-labelledby,'investimentosExterior')]
    # Scroll Element Into View    //li[contains(.,'Até 40%')]
    # SeleniumLibrary.Click Element    //li[contains(.,'Até 40%')]
    Wait And Input    //input[contains(@name,'percentualAutorizadoInvestimentoExterior')]    50
    Combo    //div[contains(@aria-labelledby,'indicadorLimitesPorEmissorAtivo')]    //li[contains(.,'Não se aplica')] 
    Combo    //div[contains(@aria-labelledby,'focoAtuacao')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'fundoEsg')]    //li[contains(.,'Não')]
    Sleep    1s
    Combo    //div[contains(@aria-labelledby,'formaCondominio')]    //li[contains(.,'Aberto')]
    # Combo    //div[contains(@aria-labelledby,'indicadorFundoInfraestrutura')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'criptoativosMaiorRiscoDaCarteira')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'prazoDuracao')]    //li[contains(.,'Indeterminado')]
    Combo    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]    //li[contains(.,'Não')]
    Combo    //div[@aria-labelledby='fundosIsentosComeCotas']    //li[contains(.,'Sim')]

Preencher restante do perfil da classe multimercado V13
    Combo    //div[contains(@aria-labelledby,'composicaoFundo')]    //li[contains(.,'CI')]
    Combo    //div[contains(@aria-labelledby,'tributacaoPerseguida')]    //li[contains(.,'Longo Prazo')]
    Combo    //div[contains(@aria-labelledby,'fundoAlavancado')]    //li[contains(.,'Não')]
    # Combo    //div[contains(@aria-labelledby,'multiGestor')]    //li[contains(.,'Multigestor')]
    Combo    //div[contains(@aria-labelledby,'derivativos')]    //li[contains(.,'Permitido')]
    Combo    //div[contains(@aria-labelledby,'possuiBenchmark')]    //li[contains(.,'Sim')] 
    Sleep    2s
    Wait And Click    //div[contains(@aria-labelledby,'benchmark')]            #opções disponíveis (CDI /CDI 30X30 / DÓLAR COMERCIAL/ DÓLAR PTAX/ EURO)
    Scroll Element Into View    //p[contains(.,'EURO')]
    SeleniumLibrary.Click Element    //p[contains(.,'EURO')]
    SeleniumLibrary.Press Keys    None    TAB
    # Wait And Click    //div[contains(@aria-labelledby,'benchmark')]
    Combo    //div[contains(@aria-labelledby,'creditoPrivado')]    //li[contains(.,'Sim')]
    Wait And Input    //input[contains(@name,'percentualCreditoPrivado')]    60
    Combo    //div[contains(@aria-labelledby,'investimentosExterior')]    //li[contains(.,'Até 40%')]
    # Wait And Click    //div[contains(@aria-labelledby,'investimentosExterior')]
    # Scroll Element Into View    //li[contains(.,'Até 40%')]
    # SeleniumLibrary.Click Element    //li[contains(.,'Até 40%')]
    Wait And Input    //input[contains(@name,'percentualAutorizadoInvestimentoExterior')]    50
    Combo    //div[contains(@aria-labelledby,'indicadorLimitesPorEmissorAtivo')]    //li[contains(.,'Não se aplica')] 
    Combo    //div[contains(@aria-labelledby,'focoAtuacao')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'fundoEsg')]    //li[contains(.,'Não')]
    Sleep    1s
    Combo    //div[contains(@aria-labelledby,'formaCondominio')]    //li[contains(.,'Aberto')]
    # Combo    //div[contains(@aria-labelledby,'indicadorFundoInfraestrutura')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'criptoativosMaiorRiscoDaCarteira')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'prazoDuracao')]    //li[contains(.,'Indeterminado')]
    Combo    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]    //li[contains(.,'Não')]
    Combo    //div[@aria-labelledby='fundosIsentosComeCotas']    //li[contains(.,'Sim')]

Preencher restante do perfil da classe multimercado Balanceados V13    #ALTERAÇÃO EFETUADO NÃO ALTERAR EM FOCO DE ATUAÇÃO ESTA CHUMBADO EM NÃO SE APLICA - ALTERAÇÃO EM 19.08.2024
    Combo    //div[contains(@aria-labelledby,'composicaoFundo')]    //li[contains(.,'CI')]
    Combo    //div[contains(@aria-labelledby,'tributacaoPerseguida')]    //li[contains(.,'Longo Prazo')]
    #Combo    //div[contains(@aria-labelledby,'fundoAlavancado')]    //li[contains(.,'Não')]
    # Combo    //div[contains(@aria-labelledby,'multiGestor')]    //li[contains(.,'Multigestor')]
    Combo    //div[contains(@aria-labelledby,'derivativos')]    //li[contains(.,'Permitido')]
    Combo    //div[contains(@aria-labelledby,'possuiBenchmark')]    //li[contains(.,'Sim')] 
    Sleep    2s
    Wait And Click    //div[contains(@aria-labelledby,'benchmark')]            #opções disponíveis (CDI /CDI 30X30 / DÓLAR COMERCIAL/ DÓLAR PTAX/ EURO)
    Scroll Element Into View    //p[contains(.,'EURO')]
    SeleniumLibrary.Click Element    //p[contains(.,'EURO')]
    SeleniumLibrary.Press Keys    None    TAB
    # Wait And Click    //div[contains(@aria-labelledby,'benchmark')]
    Combo    //div[contains(@aria-labelledby,'creditoPrivado')]    //li[contains(.,'Sim')]
    Wait And Input    //input[contains(@name,'percentualCreditoPrivado')]    60
    Combo    //div[contains(@aria-labelledby,'investimentosExterior')]    //li[contains(.,'Até 40%')]
    # Wait And Click    //div[contains(@aria-labelledby,'investimentosExterior')]
    # Scroll Element Into View    //li[contains(.,'Até 40%')]
    # SeleniumLibrary.Click Element    //li[contains(.,'Até 40%')]
    Wait And Input    //input[contains(@name,'percentualAutorizadoInvestimentoExterior')]    50
    Combo    //div[contains(@aria-labelledby,'indicadorLimitesPorEmissorAtivo')]    //li[contains(.,'Não se aplica')] 
    #Combo    //div[contains(@aria-labelledby,'focoAtuacao')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'fundoEsg')]    //li[contains(.,'Não')]
    Sleep    1s
    Combo    //div[contains(@aria-labelledby,'formaCondominio')]    //li[contains(.,'Aberto')]
    # Combo    //div[contains(@aria-labelledby,'indicadorFundoInfraestrutura')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'criptoativosMaiorRiscoDaCarteira')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'prazoDuracao')]    //li[contains(.,'Indeterminado')]
    Combo    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]    //li[contains(.,'Não')]
    Combo    //div[@aria-labelledby='fundosIsentosComeCotas']    //li[contains(.,'Sim')]

Preencher restante do perfil da nova classe alteração multimercado V13
    Combo    //div[contains(@aria-labelledby,'composicaoFundo')]    //li[contains(.,'CI')]
    Combo    //div[contains(@aria-labelledby,'tributacaoPerseguida')]    //li[contains(.,'Longo Prazo')]
    Combo    //div[contains(@aria-labelledby,'fundoAlavancado')]    //li[contains(.,'Não')]
    # Combo    //div[contains(@aria-labelledby,'multiGestor')]    //li[contains(.,'Multigestor')]
    Combo    //div[contains(@aria-labelledby,'derivativos')]    //li[contains(.,'Permitido')]
    Combo    //div[contains(@aria-labelledby,'possuiBenchmark')]    //li[contains(.,'Sim')] 
    Sleep    2s
    Wait And Click    //div[contains(@aria-labelledby,'benchmark')]            #opções disponíveis (CDI /CDI 30X30 / DÓLAR COMERCIAL/ DÓLAR PTAX/ EURO)
    Scroll Element Into View    //p[contains(.,'EURO')]
    SeleniumLibrary.Click Element    //p[contains(.,'EURO')]
    SeleniumLibrary.Press Keys    None    TAB
    # Wait And Click    //div[contains(@aria-labelledby,'benchmark')]
    Combo    //div[contains(@aria-labelledby,'creditoPrivado')]    //li[contains(.,'Sim')]
    Wait And Input    //input[contains(@name,'percentualCreditoPrivado')]    60
    Combo    //div[contains(@aria-labelledby,'investimentosExterior')]    //li[contains(.,'Até 40%')]
    # Wait And Click    //div[contains(@aria-labelledby,'investimentosExterior')]
    # Scroll Element Into View    //li[contains(.,'Até 40%')]
    # SeleniumLibrary.Click Element    //li[contains(.,'Até 40%')]
    Wait And Input    //input[contains(@name,'percentualAutorizadoInvestimentoExterior')]    50
    Combo    //div[contains(@aria-labelledby,'indicadorLimitesPorEmissorAtivo')]    //li[contains(.,'Não se aplica')] 
    Combo    //div[contains(@aria-labelledby,'focoAtuacao')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'fundoEsg')]    //li[contains(.,'Não')]
    Sleep    1s
    Combo    //div[contains(@aria-labelledby,'formaCondominio')]    //li[contains(.,'Aberto')]
    #Combo    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]    //li[contains(.,'Não')]
    Combo    //div[@aria-labelledby='fundosIsentosComeCotas']    //li[contains(.,'Sim')]
    Combo    //div[contains(@aria-labelledby,'criptoativosMaiorRiscoDaCarteira')]    //li[contains(.,'Não')]
    # Combo    //div[contains(@aria-labelledby,'indicadorFundoInfraestrutura')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'prazoDuracao')]    //li[contains(.,'Indeterminado')]
    
    



Preencher restante do perfil da classe Renda_Fixa
    Combo    //div[contains(@aria-labelledby,'composicaoFundo')]    //li[contains(.,'FI')]
    Combo    //div[contains(@aria-labelledby,'tributacaoPerseguida')]    //li[contains(.,'Curto Prazo')]
    Combo    //div[contains(@aria-labelledby,'fundoAlavancado')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'multiGestor')]    //li[contains(.,'Multigestor')]
    Combo    //div[contains(@aria-labelledby,'derivativos')]    //li[contains(.,'Permitido')]
    Combo    //div[contains(@aria-labelledby,'possuiBenchmark')]    //li[contains(.,'Sim')]    
    #Combo    //div[contains(@aria-labelledby,'benchmark')]    //li[contains(.,'EURO')]
    Wait And Click    //div[contains(@aria-labelledby,'benchmark')]
    Scroll Element Into View    //li[contains(.,'EURO')]
    SeleniumLibrary.Click Element    //li[contains(.,'EURO')]
    Combo    //div[contains(@aria-labelledby,'creditoPrivado')]    //li[contains(.,'Sim')]
    Wait And Input    //input[contains(@name,'percentualCreditoPrivado')]    60
    Combo    //div[contains(@aria-labelledby,'investimentosExterior')]    //li[contains(.,'Até 100%')]
    Wait And Input    //input[@name='percentualAutorizadoInvestimentoExterior']    100
    Visivel    //input[@value='100']
    Combo    //div[contains(@aria-labelledby,'indicadorLimitesPorEmissorAtivo')]    //li[contains(.,'Não se aplica')] 
    #Wait And Input    //input[contains(@name,'percentualAutorizadoInvestimentoExterior')]    50
    Combo    //div[contains(@aria-labelledby,'focoAtuacao')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'fundoEsg')]    //li[contains(.,'Não')]
    Sleep    1s
    Combo    //div[contains(@aria-labelledby,'formaCondominio')]    //li[contains(.,'Aberto')]
    Combo    //div[contains(@aria-labelledby,'indicadorFundoInfraestrutura')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'criptoativosMaiorRiscoDaCarteira')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'prazoDuracao')]    //li[contains(.,'Indeterminado')]
    Combo    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]    //li[contains(.,'Não')]

Preencher restante do perfil da classe RF Renda Fixa
    Combo    //div[contains(@aria-labelledby,'composicaoFundo')]    //li[contains(.,'FC')]
    Combo    //div[contains(@aria-labelledby,'tributacaoPerseguida')]    //li[contains(.,'Renda Variável')]
    Combo    //div[contains(@aria-labelledby,'fundoAlavancado')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'multiGestor')]    //li[contains(.,'Multigestor')]
    Combo    //div[contains(@aria-labelledby,'derivativos')]    //li[contains(.,'Permitido')]
    Combo    //div[contains(@aria-labelledby,'possuiBenchmark')]    //li[contains(.,'Sim')]    
    #Combo    //div[contains(@aria-labelledby,'benchmark')]    //li[contains(.,'EURO')]
    Wait And Click    //div[contains(@aria-labelledby,'benchmark')]
    Scroll Element Into View    //li[contains(.,'EURO')]
    SeleniumLibrary.Click Element    //li[contains(.,'EURO')]
    Combo    //div[contains(@aria-labelledby,'creditoPrivado')]    //li[contains(.,'Sim')]
    Wait And Input    //input[contains(@name,'percentualCreditoPrivado')]    60
    #Combo    //div[contains(@aria-labelledby,'investimentosExterior')]    //li[contains(.,'Até 100%')]
    Wait And Click    //div[contains(@aria-labelledby,'investimentosExterior')]
    Scroll Element Into View    //li[contains(.,'Até 100%')]
    SeleniumLibrary.Click Element    //li[contains(.,'Até 100%')]
    Wait And Input    //input[contains(@name,'percentualAutorizadoInvestimentoExterior')]    100
    Combo    //div[contains(@aria-labelledby,'indicadorLimitesPorEmissorAtivo')]    //li[contains(.,'Não se aplica')] 
    Combo    //div[contains(@aria-labelledby,'focoAtuacao')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'fundoEsg')]    //li[contains(.,'Não')]
    Sleep    1s
    Combo    //div[contains(@aria-labelledby,'formaCondominio')]    //li[contains(.,'Aberto')]
    Combo    //div[contains(@aria-labelledby,'indicadorFundoInfraestrutura')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'criptoativosMaiorRiscoDaCarteira')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'prazoDuracao')]    //li[contains(.,'Indeterminado')]
    Combo    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]    //li[contains(.,'Não')]

Preencher restante do perfil da classe previdencia
    Combo    //div[contains(@aria-labelledby,'composicaoFundo')]    //li[contains(.,'FI')]
    Combo    //div[contains(@aria-labelledby,'tributacaoPerseguida')]    //li[contains(.,'Previdenciário')]
    Combo    //div[contains(@aria-labelledby,'fundoAlavancado')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'multiGestor')]    //li[contains(.,'Multigestor')]
    Combo    //div[contains(@aria-labelledby,'derivativos')]    //li[contains(.,'Permitido')]
    Combo    //div[contains(@aria-labelledby,'possuiBenchmark')]    //li[contains(.,'Sim')]    
    #Combo    //div[contains(@aria-labelledby,'benchmark')]    //li[contains(.,'EURO')]
    Wait And Click    //div[contains(@aria-labelledby,'benchmark')]
    Scroll Element Into View    //li[contains(.,'EURO')]
    SeleniumLibrary.Click Element    //li[contains(.,'EURO')]
    Combo    //div[contains(@aria-labelledby,'creditoPrivado')]    //li[contains(.,'Não')]
    Sleep    3s
    Wait And Input    //input[contains(@name,'percentualCreditoPrivado')]    50
    #Combo    //div[contains(@aria-labelledby,'investimentosExterior')]    //li[contains(.,'Até 100%')]
    Wait And Click    //div[contains(@aria-labelledby,'investimentosExterior')]
    Scroll Element Into View    //li[contains(.,'Até 100%')]
    SeleniumLibrary.Click Element    //li[contains(.,'Até 100%')]
    Wait And Input    //input[contains(@name,'percentualAutorizadoInvestimentoExterior')]    50
    Combo    //div[contains(@aria-labelledby,'indicadorLimitesPorEmissorAtivo')]    //li[contains(.,'Não se aplica')] 
    
    Combo    //div[contains(@aria-labelledby,'focoAtuacao')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'fundoEsg')]    //li[contains(.,'Não')]
    Sleep    1s
    Combo    //div[contains(@aria-labelledby,'formaCondominio')]    //li[contains(.,'Aberto')]
    Combo    //div[contains(@aria-labelledby,'indicadorFundoInfraestrutura')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'criptoativosMaiorRiscoDaCarteira')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'prazoDuracao')]    //li[contains(.,'Indeterminado')]
    Combo    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]    //li[contains(.,'Não')]

Preencher restante do perfil da classe previdencia multimercado
    Combo    //div[contains(@aria-labelledby,'composicaoFundo')]    //li[contains(.,'FC')]
    Combo    //div[contains(@aria-labelledby,'tributacaoPerseguida')]    //li[contains(.,'Previdenciário')]
    Combo    //div[contains(@aria-labelledby,'fundoAlavancado')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'multiGestor')]    //li[contains(.,'Multigestor')]
    Combo    //div[contains(@aria-labelledby,'derivativos')]    //li[contains(.,'Permitido')]
    Combo    //div[contains(@aria-labelledby,'possuiBenchmark')]    //li[contains(.,'Sim')]    
    #Combo    //div[contains(@aria-labelledby,'benchmark')]    //li[contains(.,'EURO')]
    Wait And Click    //div[contains(@aria-labelledby,'benchmark')]
    Scroll Element Into View    //li[contains(.,'EURO')]
    SeleniumLibrary.Click Element    //li[contains(.,'EURO')]
    Combo    //div[contains(@aria-labelledby,'creditoPrivado')]    //li[contains(.,'Sim')]
    Wait And Input    //input[contains(@name,'percentualCreditoPrivado')]    60
    Combo    //div[contains(@aria-labelledby,'investimentosExterior')]    //li[contains(.,'Até 100%')]
    Wait And Input    //input[contains(@name,'percentualAutorizadoInvestimentoExterior')]    100
    Combo    //div[contains(@aria-labelledby,'indicadorLimitesPorEmissorAtivo')]    //li[contains(.,'Não se aplica')] 
    Combo    //div[contains(@aria-labelledby,'focoAtuacao')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'fundoEsg')]    //li[contains(.,'Não')]
    Sleep    1s
    Combo    //div[contains(@aria-labelledby,'formaCondominio')]    //li[contains(.,'Aberto')]
    Combo    //div[contains(@aria-labelledby,'indicadorFundoInfraestrutura')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'criptoativosMaiorRiscoDaCarteira')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'prazoDuracao')]    //li[contains(.,'Indeterminado')]
    Combo    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]    //li[contains(.,'Não')]

Preencher restante do perfil da classe RF Previdencia 
    Combo    //div[contains(@aria-labelledby,'composicaoFundo')]    //li[contains(.,'FM')]
    Combo    //div[contains(@aria-labelledby,'tributacaoPerseguida')]    //li[contains(.,'Previdenciário')]
    Combo    //div[contains(@aria-labelledby,'fundoAlavancado')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'multiGestor')]    //li[contains(.,'Multigestor')]
    Combo    //div[contains(@aria-labelledby,'derivativos')]    //li[contains(.,'Permitido')]
    Combo    //div[contains(@aria-labelledby,'possuiBenchmark')]    //li[contains(.,'Sim')]    
    #Combo    //div[contains(@aria-labelledby,'benchmark')]    //li[contains(.,'EURO')]
    Wait And Click    //div[contains(@aria-labelledby,'benchmark')]
    Scroll Element Into View    //li[contains(.,'EURO')]
    SeleniumLibrary.Click Element    //li[contains(.,'EURO')]
    Combo    //div[contains(@aria-labelledby,'creditoPrivado')]    //li[contains(.,'Sim')]
    Wait And Input    //input[contains(@name,'percentualCreditoPrivado')]    60
    #Combo    //div[contains(@aria-labelledby,'investimentosExterior')]    //li[contains(.,'Até 100%')]
    Sleep    2s
    Wait And Click    //div[contains(@aria-labelledby,'investimentosExterior')]
    Scroll Element Into View    //li[contains(.,'Até 100%')]
    SeleniumLibrary.Click Element    //li[contains(.,'Até 100%')]
    Wait And Input    //input[contains(@name,'percentualAutorizadoInvestimentoExterior')]    100
    Combo    //div[contains(@aria-labelledby,'indicadorLimitesPorEmissorAtivo')]    //li[contains(.,'Não se aplica')] 
    Combo    //div[contains(@aria-labelledby,'focoAtuacao')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'fundoEsg')]    //li[contains(.,'Não')]
    Sleep    1s
    Combo    //div[contains(@aria-labelledby,'formaCondominio')]    //li[contains(.,'Aberto')]
    Combo    //div[contains(@aria-labelledby,'indicadorFundoInfraestrutura')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'criptoativosMaiorRiscoDaCarteira')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'prazoDuracao')]    //li[contains(.,'Indeterminado')]
    Combo    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]    //li[contains(.,'Não')]



Preencher restante do perfil da classe Multimercado
    Combo    //div[contains(@aria-labelledby,'composicaoFundo')]    //li[contains(.,'FC')]
    Combo    //div[contains(@aria-labelledby,'tributacaoPerseguida')]    //li[contains(.,'Longo Prazo')]
    Combo    //div[contains(@aria-labelledby,'fundoAlavancado')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'multiGestor')]    //li[contains(.,'Multigestor')]
    Combo    //div[contains(@aria-labelledby,'derivativos')]    //li[contains(.,'Permitido')]
    Combo    //div[contains(@aria-labelledby,'possuiBenchmark')]    //li[contains(.,'Sim')]    
    #Combo    //div[contains(@aria-labelledby,'benchmark')]    //li[contains(.,'EURO')]
    Wait And Click    //div[contains(@aria-labelledby,'benchmark')]
    Scroll Element Into View    //li[contains(.,'EURO')]
    SeleniumLibrary.Click Element    //li[contains(.,'EURO')]
    Combo    //div[contains(@aria-labelledby,'creditoPrivado')]    //li[contains(.,'Sim')]
    Wait And Input    //input[contains(@name,'percentualCreditoPrivado')]    60
    #Combo    //div[contains(@aria-labelledby,'investimentosExterior')]    //li[contains(.,'Até 100%')]
    Wait And Click    //div[contains(@aria-labelledby,'investimentosExterior')]
    Scroll Element Into View    //li[contains(.,'Até 100%')]
    SeleniumLibrary.Click Element    //li[contains(.,'Até 100%')]
    Wait And Input    //input[contains(@name,'percentualAutorizadoInvestimentoExterior')]    100
    Combo    //div[contains(@aria-labelledby,'indicadorLimitesPorEmissorAtivo')]    //li[contains(.,'Não se aplica')] 
    Combo    //div[contains(@aria-labelledby,'focoAtuacao')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'fundoEsg')]    //li[contains(.,'Não')]
    Sleep    1s
    Combo    //div[contains(@aria-labelledby,'formaCondominio')]    //li[contains(.,'Aberto')]
    Combo    //div[contains(@aria-labelledby,'indicadorFundoInfraestrutura')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'criptoativosMaiorRiscoDaCarteira')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'prazoDuracao')]    //li[contains(.,'Indeterminado')]
    Combo    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]    //li[contains(.,'Não')]



Preencher restante do perfil da classe previdencia Participações
    Combo    //div[contains(@aria-labelledby,'composicaoFundo')]    //li[contains(.,'FC')]
    Combo    //div[contains(@aria-labelledby,'tributacaoPerseguida')]    //li[contains(.,'Não Aplicável')]
    Combo    //div[contains(@aria-labelledby,'fundoAlavancado')]    //li[contains(.,'Não')]
    #Combo    //div[contains(@aria-labelledby,'multiGestor')]    //li[contains(.,'Multigestor')]
    Combo    //div[contains(@aria-labelledby,'derivativos')]    //li[contains(.,'Permitido')]
    #Combo    //div[contains(@aria-labelledby,'possuiBenchmark')]    //li[contains(.,'Sim')]    
    #Combo    //div[contains(@aria-labelledby,'benchmark')]    //li[contains(.,'EURO')]
    #Combo    //div[contains(@aria-labelledby,'creditoPrivado')]    //li[contains(.,'Sim')]
    #Wait And Input    //input[contains(@name,'percentualCreditoPrivado')]    60
    Combo    //div[contains(@aria-labelledby,'investimentosExterior')]    //li[contains(.,'Até 100%')]
    #Combo    //div[contains(@aria-labelledby,'indicadorLimitesPorEmissorAtivo')]    //li[contains(.,'Não se aplica')] 
    #Wait And Input    //input[contains(@name,'percentualAutorizadoInvestimentoExterior')]    50
    #Combo    //div[contains(@aria-labelledby,'focoAtuacao')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'fundoEsg')]    //li[contains(.,'Não')]
    Sleep    1s
    #Combo    //div[contains(@aria-labelledby,'formaCondominio')]    //li[contains(.,'Aberto')]
    #Combo    //div[contains(@aria-labelledby,'indicadorFundoInfraestrutura')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'criptoativosMaiorRiscoDaCarteira')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'prazoDuracao')]    //li[contains(.,'Indeterminado')]
    Combo    //div[contains(@aria-labelledby,'comiteInvestimento')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'entidadeDeInvestimento')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'classificacaoFip')]    //li[contains(.,'Infra')]    
    Combo    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]    //li[contains(.,'Não')]

Preencher restante do perfil da classe acoes fmp
    Combo    //div[contains(@aria-labelledby,'composicaoFundo')]    //li[contains(.,'FI')]
    Combo    //div[contains(@aria-labelledby,'tributacaoPerseguida')]    //li[contains(.,'Renda Variável')]
    Combo    //div[contains(@aria-labelledby,'fundoAlavancado')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'multiGestor')]    //li[contains(.,'Multigestor')]
    Combo    //div[contains(@aria-labelledby,'derivativos')]    //li[contains(.,'Permitido')]
    Combo    //div[contains(@aria-labelledby,'possuiBenchmark')]    //li[contains(.,'Sim')]    
    #Combo    //div[contains(@aria-labelledby,'benchmark')]    //li[contains(.,'EURO')]
    Wait And Click    //div[contains(@aria-labelledby,'benchmark')]
    Scroll Element Into View    //li[contains(.,'EURO')]
    SeleniumLibrary.Click Element    //li[contains(.,'EURO')]
    Combo    //div[contains(@aria-labelledby,'creditoPrivado')]    //li[contains(.,'Não')]
    Wait And Input    //input[contains(@name,'percentualCreditoPrivado')]    50
    Combo    //div[contains(@aria-labelledby,'investimentosExterior')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'indicadorLimitesPorEmissorAtivo')]    //li[contains(.,'Não se aplica')]  
    Combo    //div[contains(@aria-labelledby,'focoAtuacao')]    //li[contains(.,'FMP Livre')]
    Combo    //div[contains(@aria-labelledby,'fundoEsg')]    //li[contains(.,'Não')]
    Sleep    1s
    Combo    //div[contains(@aria-labelledby,'formaCondominio')]    //li[contains(.,'Aberto')]
    Combo    //div[contains(@aria-labelledby,'indicadorFundoInfraestrutura')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'criptoativosMaiorRiscoDaCarteira')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'prazoDuracao')]    //li[contains(.,'Indeterminado')]
    Combo    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]    //li[contains(.,'Não')]

Preencher restante do perfil da classe FIDC
    Combo    //div[contains(@aria-labelledby,'composicaoFundo')]    //li[contains(.,'FI')]
    Combo    //div[contains(@aria-labelledby,'tributacaoPerseguida')]    //li[contains(.,'Curto Prazo')]
    Combo    //div[contains(@aria-labelledby,'fundoAlavancado')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'derivativos')]    //li[contains(.,'Permitido')]  
    # Combo    //div[contains(@aria-labelledby,'focoAtuacao')]    //li[contains(.,'Curto Prazo')]
    Combo    //div[contains(@aria-labelledby,'focoAtuacao')]    //li[contains(.,'Fomento Mercantil')]
    Combo    //div[contains(@aria-labelledby,'fundoEsg')]    //li[contains(.,'Não')]
    Sleep    1s
    Combo    //div[contains(@aria-labelledby,'formaCondominio')]    //li[contains(.,'Aberto')]
    Combo    //div[contains(@aria-labelledby,'criptoativosMaiorRiscoDaCarteira')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'prazoDuracao')]    //li[contains(.,'Indeterminado')]
    Combo    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]    //li[contains(.,'Não')]

Preencher restante do perfil da classe FII
    Combo    //div[contains(@aria-labelledby,'fundoAlavancado')]    //li[contains(.,'Sim')]
    Combo    //div[contains(@aria-labelledby,'derivativos')]    //li[contains(.,'Permitido')]
    Combo    //div[contains(@aria-labelledby,'focoAtuacao')]    //li[contains(.,'Não se aplica')]
    Combo    //div[contains(@aria-labelledby,'fundoEsg')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'criptoativosMaiorRiscoDaCarteira')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'prazoDuracao')]    //li[contains(.,'Indeterminado')]
    Combo    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]    //li[contains(.,'Não')]

Preencher restante do perfil da classe ETF
    Combo    //div[contains(@aria-labelledby,'derivativos')]    //li[contains(.,'Permitido')]
    Combo    //div[contains(@aria-labelledby,'fundoEsg')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'criptoativosMaiorRiscoDaCarteira')]    //li[contains(.,'Não')]
    Combo    //div[contains(@aria-labelledby,'prazoDuracao')]    //li[contains(.,'Indeterminado')]
    Combo    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]    //li[contains(.,'Não')]


Validar exigencia de categorias anbima
    [Documentation]    Definir as duas categorias ANBIMA que deseja ser validao.
    [Arguments]    ${CAT_N1}    ${CAT_N2}
    ${CAT_N1}    Convert To Upper Case    ${CAT_N1}
    ${CAT_N2}    Convert To Upper Case    ${CAT_N2}
    Log    ${CAT_N1} & ${CAT_N2}
    Visivel    //input[@name='categoriaAnbimaNivelII'][@value='${CAT_N1}']
    Visivel    //input[@name='categoriaAnbimaNivelIII'][@value='${CAT_N2}']

Validar exigencia de categorias anbima previdencia
    [Documentation]    Definir as duas categorias ANBIMA que deseja ser validao.
    [Arguments]    ${CAT_N1}    ${CAT_N2}
    ${CAT_N1}    Convert To Upper Case    ${CAT_N1}
    ${CAT_N2}    Convert To Upper Case    ${CAT_N2}
    Log    ${CAT_N1} & ${CAT_N2}
    Visivel    //input[@name='categoriaAnbimaNivelII'][@value='${CAT_N1}']
    Visivel    //input[@name='categoriaAnbimaNivelIII'][@value='${CAT_N2}']

Validar exigencia de categorias anbima vazia
    [Documentation]    Definir as duas categorias ANBIMA vazia que deseja ser validao.
    [Arguments]    ${CAT_N1}    ${CAT_N2}
    ${CAT_N1}    Convert To Upper Case    ${CAT_N1}
    ${CAT_N2}    Convert To Upper Case    ${CAT_N2}
    Log    ${CAT_N1} & ${CAT_N2}
    Visivel    //input[contains(@id,':${CAT_N1}:')]
    Visivel    //input[contains(@id,':${CAT_N2}:')]

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
    ELSE
        IF    "${valid}"=="multimercado"
            Wait And Click    //div[contains(@aria-labelledby,'sufixo')]
            Sleep    1s 
            Wait And Click    //li[contains(.,'Investimento no Exterior')]
            Wait And Click    //li[contains(.,'Longo prazo')]
            Wait And Click    //li[contains(.,'Credito privado')]
            Sleep    1s
            Wait And Click    //div[contains(@class,'MuiBackdrop-root MuiBackdrop-invisible MuiModal-backdrop css-esi9ax')]
            Sleep    1s
        ELSE
            IF    "${valid}"=="renda fixa"
                Wait And Click    //div[contains(@aria-labelledby,'sufixo')]
                Sleep    1s 
                Wait And Click    //li[contains(.,'Referenciado')]
                Wait And Click    //li[contains(.,'Curto prazo')]
                Wait And Click    //li[contains(.,'Divida externa')]
                              
                Scroll Element Into View    //li[contains(.,'Longo prazo')]
                Sleep    1s
                Wait And Click    //li[contains(.,'Investimento no Exterior')]
                Wait And Click    //li[contains(.,'Simples')]
                Wait And Click    //li[contains(.,'Credito privado')]
                #Wait And Click    //li[contains(.,'Longo prazo')]
                Sleep    1s
                Wait And Click    //div[contains(@class,'MuiBackdrop-root MuiBackdrop-invisible MuiModal-backdrop css-esi9ax')]
                Sleep    1s
            ELSE
                ${SETADO}    Run Keyword And Return Status    Visivel    //div[@class='MuiBox-root css-1ywof4l'][contains(.,'Não se aplica')]      #//span[contains(.,'Não se aplica')]
                IF    "${SETADO}"=="True"
                    Return From Keyword
                ELSE
                    Wait And Click    //div[contains(@aria-labelledby,'sufixo')]
                    Sleep    1s 
                    Scroll Element Into View    //li[contains(.,'Não se aplica')]
                    Sleep    1s
                    Wait And Click    //li[contains(.,'Não se aplica')]
                    Sleep    1s
                    Wait And Click    //div[contains(@class,'MuiBackdrop-root MuiBackdrop-invisible MuiModal-backdrop css-esi9ax')]
                    Sleep    1s
                END
            END
        END
    END


Set sulfixo previdencia
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
    ELSE
        IF    "${valid}"=="multimercado"
            Wait And Click    //div[contains(@aria-labelledby,'sufixo')]
            Sleep    1s 
            Wait And Click    //li[contains(.,'Investimento no Exterior')]
            Wait And Click    //li[contains(.,'Longo prazo')]
            Wait And Click    //li[contains(.,'Credito privado')]
            Sleep    1s
            Wait And Click    //div[contains(@class,'MuiBackdrop-root MuiBackdrop-invisible MuiModal-backdrop css-esi9ax')]
            Sleep    1s
        ELSE
            IF    "${valid}"=="renda fixa"
                Wait And Click    //div[contains(@aria-labelledby,'sufixo')]
                Sleep    1s 
                Wait And Click    //li[contains(.,'Referenciado')]
                #Wait And Click    //li[contains(.,'Curto prazo')]
                Wait And Click    //li[contains(.,'Divida externa')]
                              
                Scroll Element Into View    //li[contains(.,'Longo prazo')]
                Sleep    1s
                Wait And Click    //li[contains(.,'Investimento no Exterior')]
                #Wait And Click    //li[contains(.,'Simples')]
                Wait And Click    //li[contains(.,'Credito privado')]
                #Wait And Click    //li[contains(.,'Longo prazo')]
                Sleep    1s
                Wait And Click    //div[contains(@class,'MuiBackdrop-root MuiBackdrop-invisible MuiModal-backdrop css-esi9ax')]
                Sleep    1s
            ELSE
                ${SETADO}    Run Keyword And Return Status    Visivel    //div[@class='MuiBox-root css-1ywof4l'][contains(.,'Não se aplica')]      #//span[contains(.,'Não se aplica')]
                IF    "${SETADO}"=="True"
                    Return From Keyword
                ELSE
                    Wait And Click    //div[contains(@aria-labelledby,'sufixo')]
                    Sleep    1s 
                    Scroll Element Into View    //li[contains(.,'Não se aplica')]
                    Sleep    1s
                    Wait And Click    //li[contains(.,'Não se aplica')]
                    Sleep    1s
                    Wait And Click    //div[contains(@class,'MuiBackdrop-root MuiBackdrop-invisible MuiModal-backdrop css-esi9ax')]
                    Sleep    1s
                END
            END
        END
    END

Delay dinamico
    [Documentation]    Variável $First_Element corresponde ao primeiro elemento que será visível após a página carregar
    ...                Variável $delay corresponde ao tempo de espera
    [Arguments]    ${First_Element}    ${delay}
    FOR    ${i}    IN RANGE    0    ${delay}
        ${present}=  Run Keyword And Return Status    Element Should Be Visible    ${First_Element}
        Log    ${present}
        IF    ${present} == True
            Exit For Loop
        ELSE
            Sleep    1s
        END
    END
  
#Setup
#    Pass Execution    Setup passed
#    Log to Console    Setup

Wait And Press Keys
    [Arguments]    ${PATH}    ${KEYS}
    SeleniumLibrary.Wait Until Element Is Visible    locator=${PATH}
    SeleniumLibrary.Press Keys    ${PATH}    ${KEYS}
