*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Inconsistir o Campo Taxa Performance
    Analise-de-Registro.Analisar o Registro de Fundo - Alteração
    Sleep    2s
    SeleniumLibrary.Press Keys    None    END
    Sleep    2s
    Commons.Wait And Click    //*[@id="__next"]/main/div[2]/div/div[5]/div/div[12]/div/div[2]
    Sleep    2s
    SeleniumLibrary.Press Keys    None    END
    Sleep    2s
    Commons.Visivel    //*[@id="__next"]/main/div[2]/div/div[5]/div/div[12]/div[2]/div/div/div/div/div[7]/div/div[2]
    Commons.Wait And Click    //*[@id="__next"]/main/div[2]/div/div[5]/div/div[12]/div[2]/div/div/div/div/div[7]/div/div[2]
    Commons.Combo    //div[@aria-labelledby='subclass-performanceTax-0-0-perfilTaxaPerformance.0.0']    //li[contains(.,'Valor inválido')]
    Sleep    1s
    SeleniumLibrary.Press Keys    None    END
    Sleep    2s
    SeleniumLibrary.Scroll Element Into View    (//button[contains(.,'Enviar inconsistências')])[2]
    Commons.Wait And Click    (//button[contains(.,'Enviar inconsistências')])[2]
    Commons.Visivel    //button[@class='MuiButtonBase-root MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium MuiButton-fullWidth MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium MuiButton-fullWidth css-1v849jz'][contains(.,'Enviar inconsistências')]
    Commons.Wait And Click    //button[@class='MuiButtonBase-root MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium MuiButton-fullWidth MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium MuiButton-fullWidth css-1v849jz'][contains(.,'Enviar inconsistências')]
    Commons.Visivel    //p[contains(.,'Análise de registro')]
    SeleniumLibrary.Wait Until Element Is Not Visible    //p[contains(.,'Análise de registro')]    timeout=80s