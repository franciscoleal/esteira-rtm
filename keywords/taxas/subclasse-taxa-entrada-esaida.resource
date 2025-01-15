*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Preencher as taxas de Entrada e Saida da SubClasse
    SeleniumLibrary.Press Keys    None    HOME
    Sleep    1s
    IF    "${dados['FundoCasca']['DadosCadastrais']['TIPO_FUNDO']}" == "OFFSHORE"
        Commons.Wait And Click    //button[contains(.,'Próximo')]
    ELSE
        Commons.Combo    //div[contains(@aria-labelledby,'unidadeTaxaEntrada')]    //li[contains(.,'Percentual')]
        Commons.Wait And Input    //input[@name='valorTaxaEntrada']    20,03
        Commons.Combo    //div[contains(@aria-labelledby,'unidadeTaxaSaida')]    //li[contains(.,'Percentual')]
        Commons.Wait And Input    //input[@name='valorTaxaSaida']    18,88
        Wait Until Keyword Succeeds    5X    5s    SeleniumLibrary.Scroll Element Into View    //button[contains(.,'Próximo')]
        Commons.Wait And Click    //button[contains(.,'Próximo')]        
    END
    
    
    
    
    
    
    
    
    
    
    
    
    
