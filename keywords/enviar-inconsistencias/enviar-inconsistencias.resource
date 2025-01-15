*** Settings ***
Resource    ../../main.robot   

*** Keywords ***
Enviar Inconsistências para Instituição
    Commons.Wait And Click    (//button[contains(.,'Enviar inconsistências')])[1]
    Commons.Visivel    //h5[contains(.,'Histórico de eventos')]    20
    Commons.Wait And Click    (//button[contains(.,'Enviar inconsistências')])[3]
    ScreenCapLibrary.Take Screenshot
    