*** Settings ***
Resource    ../../main.robot

*** Keywords ***
[Fundo Casca]Preencher os Documentos
    Commons.Combo    //div[contains(@aria-labelledby,'documentType')]    //li[contains(.,'${dados['FundoCasca']['Documentos']['REGULAMENTO']}')]
    SeleniumLibrary.Press Keys    None    TAB   
    Sleep    2s  
    Commons.Set Today Date
    Sleep    2s
    SeleniumLibrary.Wait Until Element Is Visible    locator=//button[contains(.,'Adicionar')]
    SeleniumLibrary.Choose File    locator=//input[contains(@type,'file')]    file_path=${EXECDIR}${/}resources${/}data${/}REGULAMENTO.pdf  
    SeleniumLibrary.Element Should Be Visible    locator=//p[contains(.,'REGULAMENTO.pdf')]
    Sleep    2s
    ScreenCapLibrary.Take Screenshot    documentos.png