*** Settings ***
Resource    ../../main.robot

*** Variables ***


*** Keywords ***
Input dos Dados
    [Arguments]    ${PATH-JSON}
    Carregar Arquivo JSON    PATH-JSON=${PATH-JSON}