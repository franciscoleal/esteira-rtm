*** Settings ***
Resource      ../../main.robot


*** Keywords ***
[Fundo Casca]Preencher os Dados Cadastrais
    # Campo Tipo de Fundo
    Commons.Visivel    //div[contains(@aria-labelledby,'tipoFundo')]
    SeleniumLibrary.Click Element    locator=//div[contains(@aria-labelledby,'tipoFundo')]
    Commons.Visivel    //li[contains(@data-value,'${dados['FundoCasca']['DadosCadastrais']['TIPO_FUNDO']}')]
    Sleep    5s
    SeleniumLibrary.Click Element    locator=//li[contains(@data-value,'${dados['FundoCasca']['DadosCadastrais']['TIPO_FUNDO']}')]
    
    # Gera um novo CNPJ válido
    ${CNPJ_VALIDO}=    Set Valid CNPJ
    Set Global Variable    ${CNPJ_VALIDO}
    
    # Campo CNPJ do Fundo
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'cnpjFundo')] 
    Run Keyword If    ${passed}==True    SeleniumLibrary.Input Text    locator=//input[contains(@name,'cnpjFundo')]    text=${CNPJ_VALIDO}

    # Campo Código do fundo
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'codFundo')]
    Run Keyword If    ${passed}==True    SeleniumLibrary.Input Text    locator=//input[contains(@name,'codFundo')]    text=${dados['FundoCasca']['DadosCadastrais']['CODIGO_FUNDO']}

    # Campo Atributo
    Commons.Combo    //div[@aria-labelledby='atributo']    //li[contains(.,'${dados['FundoCasca']['DadosCadastrais']['ATRIBUTO']}')]
    
    # Pega a data e hora atual do sistema
    ${CURRENT_DATE}    Get Current Date    result_format=%d/%m/%Y %H:%M:%S
    
    # Campo Razão Social
    Commons.Visivel    //input[contains(@name,'razaoSocial')]
    SeleniumLibrary.Input Text    locator=//input[contains(@name,'razaoSocial')]    text=${dados['FundoCasca']['DadosCadastrais']['RAZAO_SOCIAL']} ${SPACE} (${CURRENT_DATE})
    
    # Campo Nome Comercial
    Commons.Visivel    //input[contains(@name,'nomeComercial')]
    SeleniumLibrary.Input Text    locator=//input[contains(@name,'nomeComercial')]    text=${dados['FundoCasca']['DadosCadastrais']['NOME_COMERCIAL']} ${SPACE} (${CURRENT_DATE})
    
    # Campo Website do Fundo
    Commons.Visivel    //input[contains(@name,'websiteFundo')]
    SeleniumLibrary.Input Text    locator=//input[contains(@name,'websiteFundo')]    text=${dados['FundoCasca']['DadosCadastrais']['WEBSITE']}
    
    ${today}=  Get Time
    ${today_formated}=  Convert Date  ${today}  result_format=%d
    ${TODAY}=    Replace String Using Regexp    ${today_formated}    ^0    ${EMPTY}
    
    # Campo Fundo Adaptado a RCVM175
    SeleniumLibrary.Wait Until Element Is Visible    //div[contains(@aria-labelledby,'fundoAdaptado175')]
    Commons.Combo    //div[contains(@aria-labelledby,'fundoAdaptado175')]    //li[contains(.,'${dados['FundoCasca']['DadosCadastrais']['FUNDO_ADAPTADO']}')]
    
    # Campo Pais de Origem
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'paisOrigem')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'paisOrigem')]    //li[contains(.,'${dados['FundoCasca']['DadosCadastrais']['PAIS_ORIGEM']}')]
    
    # Campo Moeda        
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'moeda')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'moeda')]    //li[contains(.,'${dados['FundoCasca']['DadosCadastrais']['MOEDA']}')]

    # Finaliza o cadastro dos Dados Cadastrais
    SeleniumLibrary.Wait Until Element Is Visible    locator=//button[contains(.,'Próximo')]
    SeleniumLibrary.Click Element    locator=//button[contains(.,'Próximo')]
    # SeleniumLibrary.Wait Until Element Is Visible    locator=//p[contains(.,'criada com sucesso')]    timeout=40s
    Sleep    4s
    # É gerado um número de solicitação para o fundo cadastrado
    ${REQ_NUM}=    SeleniumLibrary.Get Text    locator=//p[contains(.,'criada com sucesso')]
    ${REQ_NUM}=    Remove String    ${REQ_NUM}    Solicitação    criada com sucesso
    Log    ${REQ_NUM.strip()}
    ${REQ_NUM}    Set Variable    ${REQ_NUM.strip()}
    Set Global Variable    ${NUM_SOLICITACAO}    ${REQ_NUM}