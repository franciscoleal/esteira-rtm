*** Settings ***

Resource    ../../main.robot

*** Keywords ***
Acessar o HUB
    [Documentation]    A senha e o email encontra-se no .env na raiz do projeto
    ...    A validação do token não é feita pelo código enviado ao e-mail, foi desativado
    ...    por isso o uso do valor chumbado: 12345678
    [Arguments]    ${USER}    ${ENV}  
    SeleniumLibrary.Go To    url=${ENV}
    SeleniumLibrary.Wait Until Element Is Visible   locator=${logo-anbima}
    SeleniumLibrary.Wait Until Element Is Visible   locator=${email-label}
    SeleniumLibrary.Input Text    locator=${email-input}   text=${USER}
    SeleniumLibrary.Wait Until Element Is Visible   locator=${senha-label}
    SeleniumLibrary.Input Password    locator=${senha-input}    password=${PASSWORD}
    SeleniumLibrary.Click Element    locator=${entrar-button}
    # Commons.Wait And Input    ${token}    12345678 
    # Commons.Wait And Click    ${autenticar-button}    
    

Token
    Open Mailbox    host=IMAP.outlook.com    password=v8%2SYNc9    port=993    user=fj.lealgs@outlook.com
    ${LATEST} =    Wait For Email    sender=suporte.hubanbima@rtm.net.br    timeout=300
    ${HTML} =    Open Link From Email    ${LATEST}
    Should Contain    ${HTML}    Olá FRANCISCO LEAL
    Close Mailbox    