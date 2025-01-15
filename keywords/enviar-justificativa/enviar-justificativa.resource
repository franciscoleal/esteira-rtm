*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Enviar a Justificativa de Inconsistencia
    [Arguments]    ${MENSAGEM}    ${JUSTIFICATIVA}    
    Commons.Wait And Click    //button[contains(.,'Enviar justificativa')]    
    Commons.Visivel    //h6[contains(.,'Justificativa')]
    Commons.Wait And Click    //div[@aria-labelledby='codigo']
    Commons.Wait And Click    //li[contains(.,'${JUSTIFICATIVA}')]
    Commons.Wait And Input    //textarea[@name='mensagem']    ${MENSAGEM}
    Commons.Wait And Click    //button[@class='MuiButtonBase-root MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium css-wzzla9'][contains(.,'Enviar justificativa')]
    Commons.Visivel    //div[@class='MuiStack-root css-j7qwjs'][contains(.,'Sucesso')] 
    # //p[contains(.,'Justificativa de informe enviada com sucesso!')] //p[@class='MuiTypography-root MuiTypography-body2 css-xkx4c0'][contains(.,'Justificativa criada com sucesso')]
    ${NumeroSolicitacao}    SeleniumLibrary.Get Text    //p[contains(.,'#')]              
    ${NumeroSolicitacao}    Remove String    ${NumeroSolicitacao}    \#
    Commons.Wait And Click    //button[contains(.,'Finalizar')]
    Set Global Variable    ${NumeroSolicitacao}

