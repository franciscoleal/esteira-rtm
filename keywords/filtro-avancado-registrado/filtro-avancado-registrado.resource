*** Settings ***
Resource    ../../main.robot

*** Variables ***


*** Keywords ***
Filtro Avançado Registrado
    Sleep    5s
    Commons.Wait And Click     //button[contains(.,'Filtro avançado')]
    Commons.Visivel    //h6[contains(.,'Filtro avançado')]    10s
    IF    "${dados['Filtro-Avancado-Registrado']['TIPO-FUNDO']}" == "OFFSHORE"
        # Fundo
        # Campo CNPJ/Razao Social/Codigo do Fundo
        Commons.Wait And Input    //input[@name='cnpjRazaoSocialCodigoFundo']    ${dados['FundoCasca']['DadosCadastrais']['NOME_COMERCIAL']}
    ELSE
        # Fundo
        # Campo CNPJ/Razao Social/Codigo do Fundo
        Commons.Wait And Input    //input[@name='cnpjRazaoSocialCodigoFundo']    ${CNPJ_VALIDO}
        # Combo Tipo do Fundo
        Commons.Combo    //div[contains(@aria-labelledby,'tipoFundo')]    //li[contains(.,'${dados['Filtro-Avancado-Registrado']['TIPO-FUNDO']}')]    
        # Combo Status do Fundo
        Commons.Combo    //div[contains(@aria-labelledby,'statusFundo')]    //li[contains(.,'${dados['Filtro-Avancado-Registrado']['STATUS-FUNDO']}')]
        # Campo CNPJ/Razao Social do administrador
        Commons.Wait And Input    //input[contains(@name,'cnpjRazaoSocialAdministrador')]    ${dados['Filtro-Avancado-Registrado']['CNPJ-RAZAOSOCIALADMINISTRADOR']}   
        # Campo CNPJ/Razao Social do gestor
        Commons.Wait And Input    //input[contains(@name,'cnpjRazaoSocialGestor')]    ${dados['Filtro-Avancado-Registrado']['CNPJ-RAZAOSOCIALGESTOR']}
        # Campo Provedor
        Commons.Wait And Input    //input[@name='sistemaOrigem']    ${dados['Filtro-Avancado-Registrado']['PROVEDOR']}
        
        # Classe
        # Campo CNPJ / Razão Social / Código da classe
        Commons.Wait And Input    //input[contains(@name,'cnpjRazaoSocialCodigoClasse')]    ${dados['Filtro-Avancado-Registrado']['CNPJ-RAZAOSOCIAL-NOMECOMERCIAL-CODIGODACLASSE']}
        # Campo Data Inicio da Classe
        Commons.Wait And Input    //input[contains(@value,'DD/MM/YYYY')]    ${dados['Filtro-Avancado-Registrado']['DATA-INICIO-CLASSE']}

        # SubClasse
        # Campo Nome Comercial / Código da Subclasse
        Commons.Wait And Input    //input[contains(@name,'nomeComercialCodigoSubclasse')]    ${dados['Filtro-Avancado-Registrado']['NOMECOMERCIAL-CODIGODASUBCLASSE']}
        # Campo Data Inicio da Subclasse
        Commons.Wait And Input    //input[contains(@name,'dataInicioSubClasse')]    ${dados['Filtro-Avancado-Registrado']['DATA-INICIO-SUBCLASSE']}
    END
    # Botão Limpar
    # Commons.Wait And Click    //button[contains(.,'Limpar')]
    
    # Botão Aplicar
    Commons.Wait And Click    //button[contains(.,'Aplicar')]
    Sleep    4s
    Wait Until Keyword Succeeds    3x    3s    Commons.Wait And Click    //td/a[contains(@color,'primary')]