*** Settings ***
#Setando as libraries
Library    SeleniumLibrary
Library    Process
Library    Dialogs
Library    ScreenCapLibrary
Library    OperatingSystem
Library    DateTime
Library    Collections
Library    ExcelLibrary
Library    String
Library    FakerLibrary    locale=pt_BR

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador
Resource    ../../Massa/GlobalKeywords.robot
Resource    ../../TestesAutomatizados/Keywords/Keywords.robot

*** Variables ***
${price}=    70.658.534/0001-95
${CONT}
${NUM}


*** Keywords ***

Abrir o navegador
    Remove File    selenium-screenshot-1.png
    Open Browser    browser=chrome    #<--   Setando o navegador(edge, chrome, firefox)
    Delete All Cookies
    Maximize Browser Window
    # Go To    https://demoqa.com/automation-practice-form

Fechar o navegador
    Close Browser

Input random num
    Open Browser    browser=chrome
    Go To    https://demoqa.com/automation-practice-form
    ${RND_NUM}=    Generate Random String    length=5    chars=[NUMBERS]
    ${RND_NUM}=    Convert To Integer    ${RND_NUM}
    Input Text    //input[contains(@placeholder,'First Name')]    ${RND_NUM}

valid arg
    [Arguments]    ${1}    ${2}=5s

    Log To Console    ${1}, ${2}

Log para console
    [Arguments]    ${X}    
    Log To Console    ${X}

Log para controle
    [Arguments]    ${X}    
    Log To Console    ${X}
    
*** Test Cases ***

POC
    ${NUM}    Set Variable    5
    FOR    ${CONT}    IN RANGE    ${NUM}
    Log    ${CONT} & ${NUM}
    END
    


