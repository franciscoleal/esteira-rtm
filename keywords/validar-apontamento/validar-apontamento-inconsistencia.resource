*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Validar Apontamento de Inconsistência
    [Arguments]    ${CVM}=FIF    ${CVM}=FIDC    ${CVM}=FII    ${CVM}=FIP
    Sleep    2s
    SeleniumLibrary.Scroll Element Into View    //h6[contains(.,'Classes cadastradas')]
#clicar para abrir (Dados cadastrais)     
    Commons.Wait And Click    //*[@id="__next"]/main/div[2]/div/div[3]/div/div[2]/div[1]/div[2]
#abrir inconsistência em Razão social
    SeleniumLibrary.Scroll Element Into View    //p[contains(.,'Razão social')]
    Commons.Visivel    //p[contains(.,'Razão social')]
    Sleep    4s
#clicar em apontar inconsistências em abrir selecionar e valor inválido   
    Commons.Combo    //*[@id="fund-register-razaoSocial"]    //*[@id="menu-fund-register-razaoSocial"]/div[3]/ul/li[2]
    SeleniumLibrary.Press Keys    None    HOME     
#Enviar inconsistências    
    #Commons.Wait And Click   (//button[contains(.,'Enviar inconsistências')])[1]
    Commons.Wait And Click    //*[@id="__next"]/main/div[2]/div/div[1]/div/div[1]/button
    Sleep    4s
    Commons.Wait And Click    //button[@class='MuiButtonBase-root MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium MuiButton-fullWidth MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium MuiButton-fullWidth css-1v849jz'][contains(.,'Enviar inconsistências')]
    Sleep    5s