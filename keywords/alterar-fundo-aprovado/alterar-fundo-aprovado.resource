*** Settings ***
Resource    ../../main.robot


*** Keywords ***
Efetuar alteração no fundo aprovado
    Commons.Wait And Click    //button[contains(@id,'demo-positioned-button')]
    Sleep    4s
    Commons.Wait And Click    //li[contains(.,'Alteração')]
    Sleep    4s
    SeleniumLibrary.Wait Until Element Is Enabled    (//button[contains(@tabindex,'0')])[3]
    Commons.Wait And Click    (//button[contains(@tabindex,'0')])[3]

    Commons.Set Specific Date Locale XY    22    05    2024    (//div[contains(.,'Data de Alteração')])[13]    -90    0
    Commons.Visivel    //input[contains(@name,'razaoSocial')]
    ${N_FUNDO}    Get Current Date    result_format=%d/%m/%Y %H:%M:%S
    ${VEZ}    Evaluate    ${CONT}+1  
    SeleniumLibrary.Clear Element Text    //input[contains(@name,'razaoSocial')]
    Sleep    1s
    SeleniumLibrary.Input Text    locator=//input[contains(@name,'razaoSocial')]    text=${SPACE}Editado ${VEZ}a vez.

    Commons.Set Specific Date Locale XY    22    05    2024    (//div[contains(.,'Data de Alteração')])[16]    -90    0
    Commons.Visivel    //input[contains(@name,'nomeComercial')]
    SeleniumLibrary.Clear Element Text    //input[contains(@name,'nomeComercial')]
    Sleep    1s
    SeleniumLibrary.Input Text    locator=//input[contains(@name,'nomeComercial')]    text=${SPACE}Editado ${VEZ}a vez.

    Commons.Visivel    //input[contains(@name,'websiteFundo')]
    Sleep    2s
    Commons.Wait And Click    //button[contains(.,'Próximo')]    
    Sleep    2s
    Commons.Wait And Click    //span[@class='MuiStepLabel-root MuiStepLabel-vertical Mui-disabled css-r12ba4'][contains(.,'4. DocumentosNenhuma Alteração')]
    Commons.Combo    //div[@tabindex='0'][contains(.,'Selecione')]    //li[contains(.,'Regulamento')]
    Commons.Set Today Date
    SeleniumLibrary.Choose File    locator=//input[contains(@type,'file')]    file_path=${EXECDIR}${/}py-robot-cvm175-rtm${/}resources${/}data${/}REGULAMENTO.pdf
    Sleep    1s
    Commons.Combo    //div[@tabindex='0'][contains(.,'Selecione')]    //li[contains(.,'Ata de assembleia')]
    SeleniumLibrary.Choose File    locator=//input[contains(@type,'file')]    file_path=${EXECDIR}${/}py-robot-cvm175-rtm${/}resources${/}data${/}ATA_ASSEMBLEIA.pdf
    Commons.Wait And Click    //*[@id="__next"]/main/div[2]/div/div[3]/div[2]/div[1]/div[2]/div/div[1]/span
    Sleep    3s
    Commons.Wait And Click    //button[contains(.,'Salvar documentos')]
    Commons.Wait And Click    //button[contains(.,'Concluir Alterações da casca')]
    Commons.Wait And Click    //button[contains(.,'Confirmar')]
    Commons.Wait And Click    //button[contains(.,'Enviar para análise Anbima')]
    Commons.Wait And Click    (//button[contains(.,'Enviar')])[2]