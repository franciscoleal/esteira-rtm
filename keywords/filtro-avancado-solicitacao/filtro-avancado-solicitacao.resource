*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Filtro Avançado Solicitação
    Sleep    5s
    Commons.Visivel    //h6[contains(.,'Filtro avançado')]    10s
    Commons.Wait And Click     //button[contains(.,'Filtro avançado')]
    
    # Solicitação
    # Campo Numero Solicitacao
    Commons.Wait And Input    //input[contains(@name,'numeroSolicitacao')]    $TEXT

    # Combo Servico
    Commons.Combo    //div[@aria-labelledby='servico']    //li[contains(.,'${dados['Filtro-Avancado-Solicitacao']['SERVICO']}')]

    # Combo Status
    Commons.Combo    //div[@aria-labelledby='status']    //li[contains(.,'${dados['Filtro-Avancado-Solicitacao']['STATUS']}')]

    # Campo Data Atualização
    Commons.Wait And Input    //input[contains(@name,'dataAtualizacao')]    ${dados['Filtro-Avancado-Solicitacao']['DATA-ATUALIZACAO']}
    
    # Combo Status de Integração
    Commons.Combo    //div[contains(@aria-labelledby,'statusIntegracao')]    //li[contains(.,'${dados['Filtro-Avancado-Solicitacao']['STATUS-INTEGRACAO']}')]

    # Registro do fundo
    # Campo CNPJ /Razao Social / Nome Comercial / Codigo do Fundo
    Commons.Wait And Input    //input[contains(@name,'cnpjRazaoSocialCodigoFundo')]    ${CNPJ_VALIDO}

    # Combo Tipo do Fundo
    Commons.Combo    //div[contains(@aria-labelledby,'tipoFundo')]    //li[contains(.,'${dados['Filtro-Avancado-Solicitacao']['TIPO-FUNDO']}')]    
    
    # Combo Status do Fundo
    Commons.Combo    //div[contains(@aria-labelledby,'statusFundo')]    //li[contains(.,'${dados['Filtro-Avancado-Solicitacao']['STATUS-FUNDO']}')]

    # Campo CNPJ/Razao Social do administrador
    Commons.Wait And Input    //input[contains(@name,'cnpjRazaoSocialAdministrador')]    ${dados['Filtro-Avancado-Solicitacao']['CNPJ-RAZAOSOCIALADMINISTRADOR']}

    # Campo CNPJ/Razao Social do gestor
    Commons.Wait And Input    //input[contains(@name,'cnpjRazaoSocialGestor')]    ${dados['Filtro-Avancado-Solicitacao']['CNPJ-RAZAOSOCIALGESTOR']}

    # Classe
    # Campo CNPJ / Razão Social / Nome Comercial / Código da classe
    Commons.Wait And Input    //input[contains(@name,'cnpjRazaoSocialCodigoClasse')]    ${dados['Filtro-Avancado-Solicitacao']['CNPJ-RAZAOSOCIAL-NOMECOMERCIAL-CODIGODACLASSE']}

    # SubClasse
    # Campo Nome Comercial / Código da Subclasse
    Commons.Wait And Input    //input[contains(@name,'nomeComercialCodigoSubclasse')]    ${dados['Filtro-Avancado-Solicitacao']['NOMECOMERCIAL-CODIGODASUBCLASSE']}
    
    
    # Botão Limpar
    # Commons.Wait And Click    //button[contains(.,'Limpar')]

    # Botão Aplicar
    Commons.Wait And Click    //button[contains(.,'Aplicar')]
    Sleep    4s
    Wait Until Keyword Succeeds    3x    3s    Commons.Wait And Click    //td/a[contains(@color,'primary')]