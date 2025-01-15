*** Settings ***
Resource    ../../main.robot

*** Variables ***


*** Keywords ***
Alterar status para encerramento
    Commons.Delay dinamico    //a[contains(@color,'primary')]    20
    Sleep    5s
    SeleniumLibrary.Click Element    //*[@id="demo-positioned-button"]
    Sleep    1s
    Commons.Wait And Click    //li[contains(.,'Encerramento')]
    Sleep    4s
    Commons.Wait And Click    //*[@class="MuiButtonBase-root MuiAccordionSummary-root MuiAccordionSummary-gutters header-accordion css-znr3go"]/div[2]
    Sleep    3s
    SeleniumLibrary.Press Keys    NONE    END
    #clicar em ações > Encerrar    
    Sleep    2s
    Commons.Wait And Click    //button[@class='MuiButtonBase-root MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeSmall MuiButton-textSizeSmall MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeSmall MuiButton-textSizeSmall css-1wp6ev'][contains(.,'Encerrar')]
    #SeleniumLibrary.Wait Until Element Is Visible    //p[contains(.,'Importante')]
    Commons.Wait And Click    //button[contains(.,'Confirmar encerramento')]
    Commons.Set Today Date
    Commons.Wait And Click    //div[@aria-labelledby='motivoEncerramento']
    Commons.Wait And Click    //li[@data-value='Resgate total']
    Commons.Wait And Click    //button[contains(.,'Documentos')]
    Commons.Wait And Click    //div[@aria-labelledby='documentType']
    Commons.Wait And Click    //li[@data-value='ataDeAssembleia']
    SeleniumLibrary.Choose File    locator=//input[contains(@type,'file')]    file_path=C:\\AUTOMACAO_RTM_ANBIMA\\HUB\\Recursos\\Teste PDF.pdf
    SeleniumLibrary.Element Should Be Visible    locator=//p[contains(.,'Teste PDF.pdf')]
    Commons.Wait And Click    //button[@type='submit']
    Sleep    7s
    SeleniumLibrary.Click Element    //button[contains(.,'Enviar para análise anbima')]
    Sleep    5s
    #GlobalKeywords.Wait And Click    //button[contains(.,'Enviar para análise anbima')]
    SeleniumLibrary.Click Element    //button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeSmall MuiButton-containedSizeSmall MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeSmall MuiButton-containedSizeSmall css-1hqmbm'][contains(.,'Salvar')]    #//button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeSmall MuiButton-containedSizeSmall MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeSmall MuiButton-containedSizeSmall css-1k1qvv'][contains(.,'Salvar')]
    #GlobalKeywords.Wait And Click    //button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeSmall MuiButton-containedSizeSmall MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeSmall MuiButton-containedSizeSmall css-1k1qvv'][contains(.,'Salvar')]