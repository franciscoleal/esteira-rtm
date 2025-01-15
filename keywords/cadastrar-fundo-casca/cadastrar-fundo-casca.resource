*** Settings ***
Resource    ../../main.robot

*** Keywords ***
[Fundo Casca]Cadastrar Fundo Casca
    Dados-Cadastrais-Fundo-Casca.[Fundo Casca]Preencher os Dados Cadastrais
    Perfil-Fundo-Casca.[Fundo Casca]Preencher Perfil do Fundo    
    Prestadores-Fundo-Casca.[Fundo Casca]Preencher os Prestadores    
    Documentos-Fundo-Casca.[Fundo Casca]Preencher os Documentos    
    SeleniumLibrary.Wait Until Element Is Visible    locator=//button[contains(.,'Concluir fundo casca')]
    Sleep    5s
    SeleniumLibrary.Click Element    locator=//button[contains(.,'Concluir fundo casca')]
    