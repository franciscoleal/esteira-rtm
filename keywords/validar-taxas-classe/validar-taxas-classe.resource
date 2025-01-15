*** Settings ***
Resource    ../../main.robot

*** Keywords ***
[Classe]Desabilitar as taxas da classe
    Desabilitar
    Commons.Wait And Click    //button[contains(.,'Próximo')]
    Desabilitar
    Commons.Wait And Click    //button[contains(.,'Próximo')]
    Desabilitar
    Commons.Wait And Click    //button[contains(.,'Próximo')]
    Desabilitar
    Commons.Wait And Click    //button[contains(.,'Próximo')]
    Desabilitar
    Commons.Wait And Click    //button[contains(.,'Próximo')]
    Desabilitar
    Commons.Wait And Click    //button[contains(.,'Próximo')]
    Desabilitar
    Commons.Wait And Click    //button[contains(.,'Próximo')]
 
Desabilitar
    Wait Until Keyword Succeeds    5x    5ms    Commons.Visivel    //*[@id="__next"]/main/div[2]//div/p[2]/span[2]/span[1]
    Sleep    1s
    SeleniumLibrary.Press Keys    none    HOME
    Sleep    1s
    Wait Until Keyword Succeeds    5x    5ms    Commons.Wait And Click    //*[@id="__next"]/main/div[2]//div/p[2]/span[2]/span[1]