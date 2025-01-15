*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Verificar as Inconsistências enviadas pelo Autorregulador
    Sleep    4s
    Commons.Wait And Click    //button[contains(.,'Verificar inconsistências')]
    SeleniumLibrary.Wait Until Element Is Enabled    (//button[contains(@tabindex,'0')])[3]
    Commons.Wait And Click    (//button[contains(@tabindex,'0')])[3]
    
    Commons.Visivel    //input[contains(@name,'razaoSocial')]
    SeleniumLibrary.Clear Element Text    //input[contains(@name,'razaoSocial')]
    Sleep    3s
    SeleniumLibrary.Input Text    locator=//input[contains(@name,'razaoSocial')]    text=${SPACE}Correção de Inconsistência


    Commons.Visivel    //input[contains(@name,'nomeComercial')]
    SeleniumLibrary.Clear Element Text    //input[contains(@name,'nomeComercial')]
    Sleep    3s
    SeleniumLibrary.Input Text    locator=//input[contains(@name,'nomeComercial')]    text=${SPACE}Correção de Inconsistência

    Sleep    2s
    Commons.Wait And Click    //button[contains(.,'Próximo')]    

    Sleep    7s
    Commons.Wait And Click    //span[contains(.,'4. Documentos')]
    # Commons.Combo    //div[@tabindex='0'][contains(.,'Selecione')]    //li[contains(.,'Regulamento')]
    # Commons.Set Today Date
    # SeleniumLibrary.Choose File    locator=//input[contains(@type,'file')]    file_path=${EXECDIR}${/}py-robot-cvm175-rtm${/}resources${/}data${/}REGULAMENT.pdf
    # Sleep    1s
    # Commons.Combo    //div[@tabindex='0'][contains(.,'Selecione')]    //li[contains(.,'Ata de assembleia')]
    # SeleniumLibrary.Choose File    locator=//input[contains(@type,'file')]    file_path=${EXECDIR}${/}py-robot-cvm175-rtm${/}resources${/}data${/}ATA_ASSEMBLEIA.pdf
    # Commons.Wait And Click    //*[@id="__next"]/main/div[2]/div/div[3]/div[2]/div[1]/div[2]/div/div[1]/span
    # Sleep    3s
    # Commons.Wait And Click    //button[contains(.,'Salvar documentos')]

    Commons.Wait And Click    //button[contains(.,'Concluir edições do fundo casca')]
    Commons.Wait And Click    //button[contains(.,'Finalizar a edição do fundo casca')]
    Commons.Wait And Click    //button[contains(.,'Enviar para análise Anbima')] 
    Commons.Wait And Click    //button[contains(.,'Sim, enviar')]