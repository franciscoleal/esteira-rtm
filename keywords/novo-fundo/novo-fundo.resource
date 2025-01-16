*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Efetuar novo Registro de Fundos através do formulário
    Menu-Fundos.Clicar no Menu Fundos
    # Clicar no botao registro de fundos
    SeleniumLibrary.Wait Until Element Is Visible    locator=//button[contains(.,'Registro de FundosPreencha o formulário')]
    Sleep    2s
    SeleniumLibrary.Click Element    locator=//b[contains(.,'Registro de Fundos')]
    # ScreenCapLibrary.Take Screenshot