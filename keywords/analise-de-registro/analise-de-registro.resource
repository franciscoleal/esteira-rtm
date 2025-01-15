*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Analisar o Registro de Fundo - ${TIPO}
    # Menu-Fundos.Clicar no Menu Fundos    Registrados
    # Commons.Wait And Input    //input[contains(@name,'search')]    ${REQ_NUM}
    # Sleep    1s
    # SeleniumLibrary.Press Keys    //input[contains(@name,'search')]    ENTER
    # Sleep    2s
    Commons.Visivel    //a[@color='primary'][contains(.,'${NUM_SOLICITACAO}')]    20s
    Commons.Wait And Click    //a[@color='primary'][contains(.,'${NUM_SOLICITACAO}')]
    IF    "${TIPO}" == "Cadastro"
        # Acessar analise de cadastro - Analisaremos para os próximos cenários se irá separar ou não
        Wait Until Keyword Succeeds    5x    5ms    Commons.Visivel    //button[contains(.,'Analisar Cadastro')]    20s
        Sleep    3s
        Wait Until Keyword Succeeds    5x    5ms    Commons.Wait And Click    //button[contains(.,'Analisar Cadastro')]
    ELSE IF    "${TIPO}" == "Alteração"
        # Acessar analise de cadastro - Analisaremos para os próximos cenários se irá separa ou não
        Wait Until Keyword Succeeds    5x    5ms    Commons.Visivel    //button[contains(.,'Analisar Alteração')]    20s
        Sleep    3s
        Wait Until Keyword Succeeds    5x    5ms    Commons.Wait And Click    //button[contains(.,'Analisar Alteração')]
    END