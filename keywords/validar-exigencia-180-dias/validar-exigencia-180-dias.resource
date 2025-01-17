*** Settings ***
Resource    ../../main.robot

*** Variables ***


*** Keywords ***
Validar exigencia de data dentro dos 180 dias
    Sleep    2s
    Commons.Visivel    //p[contains(.,'Data de competência deve ser hoje ou nos últimos 180 dias')]
    Log    Validada a obrigatoriedade de preenchimento com data dentro de 180 dias
