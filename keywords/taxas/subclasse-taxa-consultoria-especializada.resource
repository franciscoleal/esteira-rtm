*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Preencher as taxas de Consultoria Especializada SubClasse
    Commons.Combo    //div[contains(@aria-labelledby,'cobraTaxaConsultoria')]    //li[contains(.,'Não')]      
    SeleniumLibrary.Wait Until Element Is Visible    locator=//button[contains(.,'Próximo')]
    Wait Until Keyword Succeeds    5X    5s    SeleniumLibrary.Scroll Element Into View    //button[contains(.,'Próximo')]
    Commons.Wait And Click    //button[contains(.,'Próximo')] 
    
    
    
    # Campo [Cobra Taxa Consultoria] deve ser preenchido com Sim, pois existe prestador do tipo [Consultor Especializado].
    
    
    
    
    
    
    
    