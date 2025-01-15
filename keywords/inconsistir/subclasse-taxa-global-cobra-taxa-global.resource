**** Settings ***
Resource    ../../main.robot

*** Variables ***


*** Keywords ***
Inconsistir Taxa Global da subclasse - Cobra Taxa Global
    [Documentation]    Inconsistir o campo cobra taxa global da subclasse como autorregulador
    SeleniumLibrary.Scroll Element Into View    //div[@class='MuiStack-root header-subtitle css-1svdv5w'][contains(.,'SUBCLASSE')]
    
