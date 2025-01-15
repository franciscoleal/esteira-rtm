*** Settings ***

Resource    ../../main.robot


*** Keywords ***
Alterar o perfil
    [Arguments]    ${Perfil}    ${Instituicao}    ${menu}
    Sleep    7s
    SeleniumLibrary.Click Element    //img[contains(@alt,'Anbima logo')]
    Sleep    7s
    ${CHECK}    Run Keyword And Return Status    Commons.Visivel    //div[div/p[contains(text(),'${Instituicao}')]]
    IF    "${CHECK}"=="True"
        Return From Keyword
    END
    Run Keyword If    '${menu}' == '1'
    ...    Acessar meus acessos
    # Verifica se o texto Selecione abaixo o perfil esta visivel
    Commons.Visivel    //div[div/p[text() = 'Selecione abaixo o perfil.']]//table/tbody/tr    20
    # Seta variavel linha = 1
    ${linha}=    Set variable    1
    # Faz uma contagem de quantas trs tem na tabela
    ${TotalLinhas}    SeleniumLibrary.Get Element Count    //div[div/p[text() = 'Selecione abaixo o perfil.']]//table/tbody/tr
    # Faz um range do total de trs encontrados
    FOR    ${counter}    IN RANGE    0    ${TotalLinhas}
        # Pega a td iniciando no valor da variavel linha=1 que é o Perfil/Papel = Autorregulador ou Administrador
        ${Papel}    SeleniumLibrary.Get Text    //div/div/div[2]/div/div[2]/div[1]/table/tbody/tr[${linha}]/td[2]
        # Pega a td iniciando no valor da variavel linha=1 que é a Instituição = ANBIMA ou ITAU
        ${Empresa}    SeleniumLibrary.Get Text    //div/div/div[2]/div/div[2]/div[1]/table/tbody/tr[${linha}]/td[1]
        # Faz o log do Papel, Empresa e linha
        Log    ${Papel}
        Log    ${Empresa}
        Log    ${linha}
        # Verifica se Papel contem Perfil - Papel = Autorregulador ou Administrador é igual ao passado no argumento Perfil
        # e guarda o status true or false
        ${status}    Run Keyword And Return Status    Should Contain    ${Papel}    ${Perfil}      
        # Verifica se Empresa contem Instituicao - Empresa = ANBIMA ou ITAU é igual ao passado no argumento Instituicao
        # e guarda o status true or false
        ${status_1}    Run Keyword And Return Status    Should Contain    ${Empresa}    ${Instituicao}      
        # Se for true em ambas variaveis status e status_1 entra no if
        IF    '${status}' == 'True' and '${status_1}' == "True"
            # Faz um scroll até a opcao que contem o botao selecionar referente a linha
            SeleniumLibrary.Scroll Element Into View    //div/div/div[2]/div/div[2]/div/table/tbody/tr[${linha}]/td[4]/div/button
            Commons.Wait And Click    //div/div/div[2]/div/div[2]/div/table/tbody/tr[${linha}]/td[4]/div/button
            Exit For Loop
        ELSE
            IF    '${TotalLinhas}' == '10'
                ${linha}=    Evaluate    ${linha}+1
                IF    '${counter}' == '9'
                    SeleniumLibrary.Scroll Element Into View    //div[3]/div/div/div[2]/div/div[2]/div[2]/div[2]/div[2]/button[2]
                    Commons.Wait And Click    //div[3]/div/div/div[2]/div/div[2]/div[2]/div[2]/div[2]/button[2]
                    Alterar o perfil    ${Perfil}    ${Instituicao}    2
                END
            ELSE
                ${linha}=    Evaluate    ${linha}+1
                Continue For Loop
            END
        END
    END

Acessar meus acessos
    Commons.Wait And Click    //div[@class='user-container MuiBox-root css-1mv69se']
    Commons.Wait And Click    //li[contains(.,'Meus acessos')]
