*** Settings ***
Documentation      Essa automação realiza um cadastro de massa em massa

Resource    ../../../../../main.robot

Test Setup         Navegador-Config.Abrir o navegador
Test Teardown      Navegador-Config.Fechar o navegador

*** Test Cases ***


[Registro de fundos]Cadastro de massa em massa com classe e subclasse FII V13
    [Tags]    classe    subclasse
    Login.Acessar o HUB    ${EMAIL}
    Criar fundo casca valido completo com subclasse FII V13
[Registro de fundos]Cadastro de massa em massa com classe e subclasse FIF V13
    [Tags]    classe    subclasse
    Login.Acessar o HUB    ${EMAIL}    ${LINK_HUB_UAT}    
    Criar fundo casca valido completo com subclasse FIF V13
[Registro de fundos]Cadastro de massa em massa com classe e subclasse FIP V13
    [Tags]    classe    subclasse
    Acessar o HUB    ${EMAIL}    
    Criar fundo casca valido completo com subclasse FIP V13
[Registro de fundos]Cadastro de massa em massa com classe e subclasse ETF V13
    [Tags]    classe    subclasse
    Acessar o HUB    ${EMAIL}    
    Criar fundo casca valido completo com subclasse ETF V13
[Registro de fundos]Cadastro de massa em massa com classe e subclasse OFFSHORE V13
    [Tags]    classe    subclasse
    Acessar o HUB    ${EMAIL}    
    Criar fundo casca valido completo com subclasse OFFSHORE V13
[Registro de fundos]Cadastro de massa em massa com classe e subclasse FIDC V13
    [Tags]    classe    subclasse
    Acessar o HUB    ${EMAIL}    
    Criar fundo casca valido completo com subclasse FIDC V13