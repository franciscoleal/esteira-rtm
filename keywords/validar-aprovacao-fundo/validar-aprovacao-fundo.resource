*** Settings ***
Resource    ../../main.robot

*** Variables ***


*** Keywords ***
Validar Aprovacao do Registro
    Sleep    7s
    Commons.Wait And Input    //input[contains(@name,'search')]    ${NUM_SOLICITACAO}
    Sleep    5s
    Commons.Wait And Press Keys    //input[contains(@name,'search')]    ENTER
    Sleep    4s
    ${Status}=    Run Keyword And Return Status    Commons.Visivel    //span[contains(.,'Aprovado')]
    IF    "${Status}" == "False"
        SeleniumLibrary.Press Keys    //input[contains(@name,'search')]    CTRL+A+DELETE
        Validar Aprovacao do Registro
    END 
    Sleep    5s
    ScreenCapLibrary.Take Screenshot