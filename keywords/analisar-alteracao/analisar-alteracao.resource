*** Settings ***
Resource    ../../main.robot


*** Keywords ***
Analisar Alteração
    Sleep    4s
    Commons.Visivel    //button[contains(.,'Analisar Alteração')]
    SeleniumLibrary.Wait Until Element Is Enabled    //button[contains(.,'Analisar Alteração')]
    Commons.Wait And Click    //button[contains(.,'Analisar Alteração')] 
    Sleep    3s
    SeleniumLibrary.Scroll Element Into View    //p[contains(.,'Razão social')]
    Commons.Combo    //div[@aria-labelledby='fund-register-razaoSocial']    //li[contains(.,'Valor inválido')]
    Commons.Combo    //div[@aria-labelledby='fund-register-nomeComercial']    //li[contains(.,'Valor inválido')]
    SeleniumLibrary.Scroll Element Into View    (//button[contains(.,'Enviar inconsistências')])[1]