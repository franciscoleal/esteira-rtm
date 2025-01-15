*** Settings ***
Resource    ../../main.robot


*** Keywords ***
Aprovar Registro de Fundo
    # Wait Until Keyword Succeeds    5x    5ms    Commons.Wait And Click    (//button[contains(.,'Aprovar registro')])[1]
    # Commons.Wait And Click    //button[contains(.,'Confirmar')]
    # Sleep    1s


    Commons.Wait And Click    (//button[contains(.,'Aprovar registro')])[1]
    Sleep    3s
    Commons.Wait And Click    //button[contains(.,'Confirmar')]
    Sleep    10s
    ScreenCapLibrary.Take Screenshot

    # SeleniumLibrary.Wait Until Element Is Visible    //p[@class='MuiTypography-root MuiTypography-body1 css-zjfs7j'][contains(.,'Aprovação da solicitação')]    20
    # SeleniumLibrary.Wait Until Element Is Not Visible    //p[@class='MuiTypography-root MuiTypography-body1 css-zjfs7j'][contains(.,'Aprovação da solicitação')]    20
    
    # # Validar status aprovado
    # Commons.Wait And Input    //input[contains(@name,'search')]    ${REQ_NUM}
    # Sleep    1s
    # SeleniumLibrary.Press Keys    //input[contains(@name,'search')]    ENTER
    # Sleep    2s
    # Commons.Visivel    //a[@color='primary'][contains(.,'${REQ_NUM}')]    20
    # ${VALID}    Run Keyword And Return Status    Commons.Visivel    //div[@class='MuiChip-root MuiChip-outlined MuiChip-sizeMedium MuiChip-colorDefault MuiChip-outlinedDefault css-kr6qfd'][contains(.,'Aprovado')]
    # WHILE    "${VALID}"=="False"
    #     SeleniumLibrary.Press Keys    //input[contains(@name,'search')]    CTRL+A+DELETE
    #     Commons.Wait And Input    //input[contains(@name,'search')]    ${REQ_NUM}
    #     Sleep    1s
    #     SeleniumLibrary.Press Keys    //input[contains(@name,'search')]    ENTER
    #     Sleep    1s
    #     Commons.Visivel    //a[@color='primary'][contains(.,'${REQ_NUM}')]    20
    #     ${VALID}    Run Keyword And Return Status    Commons.Visivel    //div[@class='MuiChip-root MuiChip-outlined MuiChip-sizeMedium MuiChip-colorDefault MuiChip-outlinedDefault css-kr6qfd'][contains(.,'Aprovado')]
    # END
    # ScreenCapLibrary.Take Screenshot    Evidencia_Aprovado