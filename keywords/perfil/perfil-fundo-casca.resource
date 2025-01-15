*** Settings ***
Resource    ../../main.robot

*** Keywords ***
[Fundo Casca]Preencher Perfil do Fundo
    # Campo Prazo de Depuração
    Commons.Combo    //div[contains(@aria-labelledby,'prazoDeDuracao')]    //li[contains(.,'${dados['FundoCasca']['PerfilDoFundo']['PRAZO_DEPURACAO']}')]
    Sleep    3s
    # Campo Duração em Meses
    # Commons.Wait And Click    //input[contains(@name,'duracaoEmMeses')]
    SeleniumLibrary.Wait Until Page Does Not Contain Element    //p[contains(.,'Os preenchimentos/edições na etapa anterior foram salvos')]    60
    Commons.Visivel    //button[contains(.,'Próximo')]     
    SeleniumLibrary.Click Element    locator=//button[contains(.,'Próximo')]