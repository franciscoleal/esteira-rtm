*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Carregar Arquivo JSON
    [Arguments]    ${PATH-JSON}
    ${PATH-JSON}    Normalize Path    path=${PATH-JSON}
    ${dados}    Load Json From File    ${PATH-JSON}    encoding=utf-8
    Set Global Variable    ${dados}