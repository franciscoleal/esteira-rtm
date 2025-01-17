*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Abrir o navegador
    SeleniumLibrary.Open Browser    browser=headlesschrome                    #headlesschrome  chrome                                              
    SeleniumLibrary.Delete All Cookies
    SeleniumLibrary.Maximize Browser Window
    # Start Video Recording    embed=True    embed_width=800px    
    
Fechar o navegador
    Stop Video Recording
    # SeleniumLibrary.Close Browser