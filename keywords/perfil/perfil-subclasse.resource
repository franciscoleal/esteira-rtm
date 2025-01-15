*** Settings ***
Resource    ../../main.robot

*** Keywords ***
[SubClasse]Preencher Perfil da SubClasse
    ${COD_CVM}    Commons.Random Number    10
    
    # Campo Código CVM
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'codigoCvm')]
    Run Keyword If    ${passed}==True    Commons.Wait And Input    //input[contains(@name,'codigoCvm')]    ${COD_CVM}
    
    # Campo Código B3
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'codigoB3')]
    Run Keyword If    ${passed}==True    Commons.Wait And Input    //input[contains(@name,'codigoB3')]    ${COD_CVM}        
    
    Sleep    3s
    # Campo Restrição de Investimento
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'restricaoInvestimento')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'restricaoInvestimento')]    //li[contains(.,'${dados['SubClasse']['PerfilDaSubClasse']['RESTRICAO_INVESTIMENTO']}')]
    
    # Campo Vinculo de Restrição
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'opcoesDeRestrito')]
    Run Keyword If    ${passed}==True    Commons.Combo    //input[contains(@name,'opcoesDeRestrito')]     //li[contains(.,'${dados['SubClasse']['PerfilDaSubClasse']['VINCULO_RESTRICAO']}')]   

    # Campo Tipo de Investidor
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'tipoInvestidor')]    
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'tipoInvestidor')]    //li[contains(.,'${dados['SubClasse']['PerfilDaSubClasse']['TIPO_INVESTIDOR']}')]
    
    # Campo Estratégia de Distribuição
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'estrategiaDistribuicao')]    
    Run Keyword If    ${passed}==True    Commons.Combo    //div[@aria-labelledby='estrategiaDistribuicao']    //li[contains(.,'${dados['SubClasse']['PerfilDaSubClasse']['ESTRATEGIA_DISTRIBUICAO']}')] 
    
    # Campo Aplicaçao Automática
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'indicadorAplicacaoAutomatica')]    
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'indicadorAplicacaoAutomatica')]    //li[contains(.,'${dados['SubClasse']['PerfilDaSubClasse']['APLICACAO_AUTOMATICA']}')]   
    
    # Campo Plano de Previdência 
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'planoPrevidencia')]    
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'planoPrevidencia')]    //li[contains(.,'${dados['SubClasse']['PerfilDaSubClasse']['PLANO_PREVIDENCIA']}')]   
    
    # Campo Periodicidade de envio de PL/Cota
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'periodicidadeEnvioPLCota')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'periodicidadeEnvioPLCota')]    //li[contains(.,'${dados['SubClasse']['PerfilDaSubClasse']['PERIODICIDADE_ENVIO_PLCOTA']}')]
    
    # Campo Cálculo da Cota
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'calculoCota')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'calculoCota')]    //li[contains(.,'${dados['SubClasse']['PerfilDaSubClasse']['CALCULO_COTA']}')]
    
    Commons.Wait And Click    //button[contains(.,'Próximo')]    