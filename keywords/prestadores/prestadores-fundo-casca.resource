*** Settings ***
Resource    ../../main.robot

*** Keywords ***
[Fundo Casca]Preencher os Prestadores
    # Campo Tipo de Prestador
    Commons.Combo    //div[contains(@aria-labelledby,'tipoPrestador')]    //li[@data-value='${dados['FundoCasca']['Prestadores']['ADMINISTRADOR']}']
    # Campo CNPJ do Prestador
    Commons.Wait And Input    //input[contains(@name,'cnpjCpf')]    ${dados['FundoCasca']['Prestadores']['CNPJ']}            
    SeleniumLibrary.Press Keys    none    RETURN
    Commons.Visivel    //td[contains(.,'Administrador')]    40
    # Campo Tipo de Prestador
    Commons.Combo    //div[contains(@aria-labelledby,'tipoPrestador')]    //li[@data-value='${dados['FundoCasca']['Prestadores']['GESTOR']}']
    # Campo CNPJ do Prestador
    Commons.Wait And Input    //input[contains(@name,'cnpjCpf')]    ${dados['FundoCasca']['Prestadores']['CNPJ']}         
    SeleniumLibrary.Press Keys    none    RETURN
    Commons.Visivel    //td[contains(.,'Gestor')]    40
    SeleniumLibrary.Wait Until Element Is Visible    locator=//button[contains(.,'Próximo')]
    SeleniumLibrary.Click Element    locator=//button[contains(.,'Próximo')]