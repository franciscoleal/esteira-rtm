*** Settings ***
Resource    ../../main.robot

*** Keywords ***
[Classe]Preencher os Dados Cadastrais da Classe
    IF    "${dados['ATRIBUTO-CLASSE']}" == "Multiclasse"
        ${CNPJ_VALIDO}    Set Valid CNPJ
    END
    
    IF    "${dados['ATRIBUTO-CLASSE']}" != "Offshore" 
        # Campo CNPJ da Classe
        # ${passed}=    Run Keyword And Return Status
        # ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'cnpjClasse')]  
        # Run Keyword If    ${passed}==True    
        Commons.Wait And Input    //input[contains(@name,'cnpjClasse')]    ${CNPJ_VALIDO}
    END

    Sleep    4s
    # Campo Código da Classe
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'codigoClasse')]
    Run Keyword If    ${passed}==True    Commons.Wait And Input    //input[contains(@name,'codigoClasse')]    ${dados['Classe']['DadosCadastrais']['CODIGO_CLASSE']}    


    # Campo Evento
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'evento')]    
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'evento')]    //li[contains(.,'${dados['Classe']['DadosCadastrais']['EVENTO']}')]
    
    # Campo Razão Social
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'razaoSocial')]
    Run Keyword If    ${passed}==True    Commons.Wait And Input    //input[contains(@name,'razaoSocial')]    ${dados['Classe']['DadosCadastrais']['RAZAO_SOCIAL']}
    
    # Campo Nome Comercial
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'nomeComercial')]
    Run Keyword If    ${passed}==True    Commons.Wait And Input    //input[contains(@name,'nomeComercial')]    ${dados['Classe']['DadosCadastrais']['NOME_COMERCIAL']}
    
    # Campo Inicio da Atividade
    Commons.Set Today Date
    Sleep    2s
    Commons.Wait And Click    //button[contains(.,'Próximo')]