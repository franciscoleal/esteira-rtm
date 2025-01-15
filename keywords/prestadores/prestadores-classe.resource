*** Settings ***
Resource      ../../main.robot

*** Keywords ***
[Classe]Preencher os Prestadores da Classe           
    IF    "${dados['FundoCasca']['DadosCadastrais']['TIPO_FUNDO']}" == "FIF" and "${dados['Classe']['PerfilDaClasse']['CATEGORIA_CVM']}" == "Multimercados"
        Sleep    5s
        # Auditor Independente
        Commons.Combo    //div[contains(@aria-labelledby,'tipoPrestador')]    //li[contains(.,'Auditor independente')]
        Commons.Wait And Input    //input[contains(@name,'cnpjCpf')]    ${dados['Classe']['PrestadoresDaClasse']['CNPJ-INSTITUICAO1']}    #Itau    
        SeleniumLibrary.Press Keys    none    RETURN
        Commons.Visivel    //td[contains(.,'Auditor independente')]    30
        
        # Custodiante
        Commons.Combo    //div[contains(@aria-labelledby,'tipoPrestador')]    //li[contains(.,'Custodiante')]
        Commons.Wait And Input    //input[contains(@name,'cnpjCpf')]    ${dados['Classe']['PrestadoresDaClasse']['CNPJ-INSTITUICAO1']}    #Itau     
        SeleniumLibrary.Press Keys    none    RETURN
        Wait Until Keyword Succeeds    5x    3s    Commons.Visivel    //td[contains(.,'Custodiante')]    30
       
        # Controladoria
        Commons.Combo    //div[contains(@aria-labelledby,'tipoPrestador')]    //li[contains(.,'Controladoria')]
        Commons.Wait And Input    //input[contains(@name,'cnpjCpf')]    ${dados['Classe']['PrestadoresDaClasse']['CNPJ-INSTITUICAO1']}    #Itau    
        SeleniumLibrary.Press Keys    none    RETURN
        Wait Until Keyword Succeeds    5x    3s    Commons.Visivel    //td[contains(.,'Controladoria')]    30

        # Co-gestor
        Commons.Combo    //div[contains(@aria-labelledby,'tipoPrestador')]    //li[contains(@data-value,'CO_GESTOR')]
        Commons.Wait And Input    //input[contains(@name,'cnpjCpf')]    ${dados['Classe']['PrestadoresDaClasse']['CNPJ-INSTITUICAO1']}    #Bramerra
        SeleniumLibrary.Press Keys    none    RETURN
        Wait Until Keyword Succeeds    5x    3s    Commons.Visivel    //p[contains(.,'Co-gestor')]

        # Co-gestor
        Commons.Combo    //div[contains(@aria-labelledby,'tipoPrestador')]    //li[contains(@data-value,'CO_GESTOR')]
        Commons.Wait And Input    //input[contains(@name,'cnpjCpf')]    ${dados['Classe']['PrestadoresDaClasse']['CNPJ-INSTITUICAO2']}    #Bramerra
        SeleniumLibrary.Press Keys    none    RETURN
        Wait Until Keyword Succeeds    5x    3s    Commons.Visivel    //p[contains(.,'Co-gestor')]
        
    ELSE IF    "${dados['FundoCasca']['DadosCadastrais']['TIPO_FUNDO']}" == "FIF" and "${dados['Classe']['PerfilDaClasse']['CATEGORIA_CVM']}" == "Ações"
        # Auditor Independente
        Commons.Combo    //div[contains(@aria-labelledby,'tipoPrestador')]    //li[contains(.,'Auditor independente')]
        Commons.Wait And Input    //input[contains(@name,'cnpjCpf')]    ${dados['Classe']['PrestadoresDaClasse']['CNPJ-INSTITUICAO1']}    #Itau    
        SeleniumLibrary.Press Keys    none    RETURN
        Commons.Visivel    //td[contains(.,'Auditor independente')]    30
        
        # Custodiante
        Commons.Combo    //div[contains(@aria-labelledby,'tipoPrestador')]    //li[contains(.,'Custodiante')]
        Commons.Wait And Input    //input[contains(@name,'cnpjCpf')]    ${dados['Classe']['PrestadoresDaClasse']['CNPJ-INSTITUICAO1']}    #Itau    
        SeleniumLibrary.Press Keys    none    RETURN
        Wait Until Keyword Succeeds    5x    3s    Commons.Visivel    //td[contains(.,'Custodiante')]    30

        # Controladoria
        Commons.Combo    //div[contains(@aria-labelledby,'tipoPrestador')]    //li[contains(.,'Controladoria')]
        Commons.Wait And Input    //input[contains(@name,'cnpjCpf')]    ${dados['Classe']['PrestadoresDaClasse']['CNPJ-INSTITUICAO1']}    #Itau    
        SeleniumLibrary.Press Keys    none    RETURN
        Wait Until Keyword Succeeds    5x    3s    Commons.Visivel    //td[contains(.,'Controladoria')]    30
    
    ELSE IF    "${dados['FundoCasca']['DadosCadastrais']['TIPO_FUNDO']}" == "ETF" and "${dados['Classe']['PerfilDaClasse']['TIPO_ANBIMA']}" == "ETF Renda Fixa"
        # Auditor Independente
        Commons.Combo    //div[contains(@aria-labelledby,'tipoPrestador')]    //li[contains(.,'Auditor independente')]
        Commons.Wait And Input    //input[contains(@name,'cnpjCpf')]    ${dados['Classe']['PrestadoresDaClasse']['CNPJ-INSTITUICAO1']}    #Itau    
        SeleniumLibrary.Press Keys    none    RETURN
        Commons.Visivel    //td[contains(.,'Auditor independente')]    30
        
        # Custodiante
        Commons.Combo    //div[contains(@aria-labelledby,'tipoPrestador')]    //li[contains(.,'Custodiante')]
        Commons.Wait And Input    //input[contains(@name,'cnpjCpf')]    ${dados['Classe']['PrestadoresDaClasse']['CNPJ-INSTITUICAO1']}    #Itau     
        SeleniumLibrary.Press Keys    none    RETURN
        Wait Until Keyword Succeeds    5x    3s    Commons.Visivel    //td[contains(.,'Custodiante')]    30
        
        # Consultor-Especializado
        Commons.Combo    //div[contains(@aria-labelledby,'tipoPrestador')]    //li[contains(@data-value,'CONSULTOR_ESPECIALIZADO')]    
        Commons.Wait And Input    //input[contains(@name,'cnpjCpf')]    ${dados['Classe']['PrestadoresDaClasse']['CNPJ-INSTITUICAO1']}    #Itau     
        # Wait And Input    //input[contains(@name,'cnpjCpf')]    46977431000103    #Bramerra
        # Wait And Input    //input[contains(@name,'cnpjCpf')]    32351126000105    #5G  
        SeleniumLibrary.Press Keys    none    RETURN
        Wait Until Keyword Succeeds    5x    3s    Commons.Visivel    //p[contains(.,'Consultor especializado')]    30
        
        # Controladoria
        Commons.Combo    //div[contains(@aria-labelledby,'tipoPrestador')]    //li[contains(.,'Controladoria')]
        Commons.Wait And Input    //input[contains(@name,'cnpjCpf')]    ${dados['Classe']['PrestadoresDaClasse']['CNPJ-INSTITUICAO1']}    #Itau  
        SeleniumLibrary.Press Keys    none    RETURN
        Wait Until Keyword Succeeds    5x    3s    Commons.Visivel    //td[contains(.,'Controladoria')]    30
        
        # Co-gestor
        Commons.Combo    //div[contains(@aria-labelledby,'tipoPrestador')]    //li[contains(@data-value,'CO_GESTOR')]
        Commons.Wait And Input    //input[contains(@name,'cnpjCpf')]    ${dados['Classe']['PrestadoresDaClasse']['CNPJ-INSTITUICAO1']}    #Itau     
        # Wait And Input    //input[contains(@name,'cnpjCpf')]    46977431000103    #Bramerra
        # Wait And Input    //input[contains(@name,'cnpjCpf')]    32351126000105    #5G  
        SeleniumLibrary.Press Keys    none    RETURN
        Wait Until Keyword Succeeds    5x    3s    Commons.Visivel    //p[contains(.,'Co-gestor')]

        # Co-gestor
        Commons.Combo    //div[contains(@aria-labelledby,'tipoPrestador')]    //li[contains(@data-value,'CO_GESTOR')]
        Commons.Wait And Input    //input[contains(@name,'cnpjCpf')]    ${dados['Classe']['PrestadoresDaClasse']['CNPJ-INSTITUICAO2']}    #Bramerra
        SeleniumLibrary.Press Keys    none    RETURN
        Wait Until Keyword Succeeds    5x    3s    Commons.Visivel    //p[contains(.,'Co-gestor')]
        
    ELSE IF    "${dados['FundoCasca']['DadosCadastrais']['TIPO_FUNDO']}" == "OFFSHORE"
        Sleep    5s
        Commons.Combo    //div[contains(@aria-labelledby,'tipoPrestador')]    //li[contains(@data-value,'AUDITOR_INDEPENDENTE')]
        Commons.Wait And Input    //input[contains(@name,'cnpjCpf')]    ${dados['Classe']['PrestadoresDaClasse']['CNPJ-INSTITUICAO1']}
        SeleniumLibrary.Press Keys    none    RETURN
        Sleep    2s
        Commons.Visivel    //td[contains(.,'Auditor independente')]

        Commons.Combo    //div[contains(@aria-labelledby,'tipoPrestador')]    //li[contains(.,'Custodiante')]
        Commons.Wait And Input    //input[contains(@name,'cnpjCpf')]    ${dados['Classe']['PrestadoresDaClasse']['CNPJ-INSTITUICAO1']}
        SeleniumLibrary.Press Keys    none    RETURN
        Wait Until Keyword Succeeds    5x    3s    Commons.Visivel    //td[contains(.,'Custodiante')]    30
        
        # Commons.Combo    //div[contains(@aria-labelledby,'tipoPrestador')]    //li[contains(@data-value,'CONSULTOR_ESPECIALIZADO')]    
        # Commons.Wait And Input    //input[contains(@name,'cnpjCpf')]    ${dados['Classe']['PrestadoresDaClasse']['CNPJ-INSTITUICAO1']}      
        # SeleniumLibrary.Press Keys    none    RETURN
        # Wait Until Keyword Succeeds    5x    3s    Commons.Visivel    //p[contains(.,'Consultor especializado')]    30

        Commons.Combo    //div[contains(@aria-labelledby,'tipoPrestador')]    //li[contains(.,'Controladoria')]
        Commons.Wait And Input    //input[contains(@name,'cnpjCpf')]    ${dados['Classe']['PrestadoresDaClasse']['CNPJ-INSTITUICAO1']}   
        SeleniumLibrary.Press Keys    none    RETURN
        Wait Until Keyword Succeeds    5x    3s    Commons.Visivel    //td[contains(.,'Controladoria')]    30

        Commons.Combo    //div[contains(@aria-labelledby,'tipoPrestador')]    //li[contains(@data-value,'CO_GESTOR')]
        Commons.Wait And Input    //input[contains(@name,'cnpjCpf')]    ${dados['Classe']['PrestadoresDaClasse']['CNPJ-INSTITUICAO1']}    
        SeleniumLibrary.Press Keys    none    RETURN
        Wait Until Keyword Succeeds    5x    3s    Commons.Visivel    //p[contains(.,'Co-gestor')]
            
    END
    




    