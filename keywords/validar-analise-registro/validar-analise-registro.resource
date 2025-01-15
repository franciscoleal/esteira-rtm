*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Validar Analise de Registro
    [Arguments]    ${Evidencia}
    Menu-Fundos.Clicar no Menu Fundos
    Wait And Input    //input[contains(@name,'search')]    ${REG_NUM}
    SeleniumLibrary.Press Keys    //input[contains(@name,'search')]    ENTER
    Sleep    2s
    Commons.Visivel    //a[contains(.,'${REG_NUM}')]
    Commons.Wait And Click    //a[contains(.,'${REG_NUM}')]
    Commons.Wait And Click    //button[contains(.,'Verificar inconsistências')]
    Sleep    2s
    SeleniumLibrary.Press Keys    None    END
    Sleep    2s
    Commons.Wait And Click    //*[@id="__next"]/main/div[2]/div/div[2]/div[2]/div/div[2]/div/div/div/div/div/div[3]/div/div[8]/p/a/button
    Commons.Visivel    //span[@class='MuiStepLabel-labelContainer css-ey7gx6'][contains(.,'3. Taxas(1) Inconsistência')]
    Commons.Wait And Click    //span[@class='MuiStepLabel-labelContainer css-ey7gx6'][contains(.,'3. Taxas(1) Inconsistência')]
    Commons.Visivel    //button[@class='MuiButtonBase-root MuiTab-root MuiTab-textColorPrimary css-114f9m9'][contains(.,'Performance1')]
    Commons.Wait And Click    //button[@class='MuiButtonBase-root MuiTab-root MuiTab-textColorPrimary css-114f9m9'][contains(.,'Performance1')]
    Commons.Visivel    //span[contains(.,'Valor inválido')]
    Take Screenshot    ${Evidencia}