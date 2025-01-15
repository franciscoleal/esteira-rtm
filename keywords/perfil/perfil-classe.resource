*** Settings ***
Resource    ../../main.robot

*** Keywords ***
[Classe]Preencher Perfil da Classe
    [Documentation]
    Sleep    7s
    SeleniumLibrary.Element Should Be Visible    locator=//span[contains(.,'Cadastrar perfil da classe')]
    # Campo Categoria CVM
    Commons.Combo    //div[contains(@aria-labelledby,'categoriaCvm')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['CATEGORIA_CVM']}')]
    Sleep    3s
    ${CVM}    Convert To Lower Case    ${dados['Classe']['PerfilDaClasse']['CATEGORIA_CVM']}
    ${CVM}    Replace String    ${CVM}    ç    c
    ${CVM}    Replace String    ${CVM}    õ    o
    
    # Campo Sufixo
    Commons.Set sulfixo    ${CVM}

    Sleep    3s

    # Campo Categoria Anbima
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[@name='categoriaAnbima'] 
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'categoriaAnbima')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['CATEGORIA_ANBIMA']}')]
    
    Sleep    1s
    # Campo Tipo Anbima
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'tipoAnbima')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'tipoAnbima')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['TIPO_ANBIMA']}')]
    
    # Campo Sub-Categoria Anbima Nível 2
    ${passed}=    Run Keyword And Return Status        
    ...    SeleniumLibrary.Element Should Be Enabled    //input[@name='categoriaAnbimaNivelII']    
    Run Keyword If    ${passed}==True    Commons.Wait And Input    //input[@name='categoriaAnbimaNivelII']    ${dados['Classe']['PerfilDaClasse']['SUB_CATEGORIA_N2']}

    
    # Campo Sub-Categoria Anbima Nível 3      
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'categoriaAnbimaNivelIII')]
    Run Keyword If    ${passed}==True    Commons.Wait And Input    //input[contains(@name,'categoriaAnbimaNivelIII')]    ${dados['Classe']['PerfilDaClasse']['SUB_CATEGORIA_N3']}       
    
    # Campo Composição
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'composicaoFundo')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'composicaoFundo')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['COMPOSICAO']}')]       #opções disponíveis (CI /CIC / CICPC/ CIPC)
    

    # Campo Tributação Perseguida
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'tributacaoPerseguida')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'tributacaoPerseguida')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['TRIBUTACAO_PERSEGUIDA']}')]     # campo ja vem com informação opções disponíveis (Longo Prazo /Curto Prazo / Alícota de 15%/ Não Aplicável/ Outros/ Insento)
    
    # Campo Fundo Alavancado
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'fundoAlavancado')]    
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'fundoAlavancado')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['FUNDO_ALAVANCADO']}')]
    
    # Campo Derivativos
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'derivativos')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'derivativos')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['DERIVATIVOS']}')]
    
    # Campo Possui Benchmark
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'possuiBenchmark')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'possuiBenchmark')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['POSSUI_BENCHMARK']}')]
    
    # Campo Benchmark
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'benchmark')]
    IF    ${passed}==True
        Commons.Wait And Click    //div[contains(@aria-labelledby,'benchmark')]            #opções disponíveis (CDI /CDI 30X30 / DÓLAR COMERCIAL/ DÓLAR PTAX/ EURO)
        SeleniumLibrary.Scroll Element Into View    //p[contains(.,'${dados['Classe']['PerfilDaClasse']['BENCHMARK']}')]
        SeleniumLibrary.Click Element    //p[contains(.,'${dados['Classe']['PerfilDaClasse']['BENCHMARK']}')]
        SeleniumLibrary.Press Keys    None    TAB
    END
    
    # Campo Credito Privado
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'creditoPrivado')]    
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'creditoPrivado')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['CREDITO_PRIVADO']}')]    ### campo ja vem com informação
    
    # Campo Percentual Permitido em Credito Privado
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'percentualCreditoPrivado')]
    Run Keyword If    ${passed}==True    Commons.Wait And Input    //input[contains(@name,'percentualCreditoPrivado')]    ${dados['Classe']['PerfilDaClasse']['PERCENTUAL_PERMITIDO_CREDITO_PRIVADO']}
    Sleep    3s
    
    # Campo Investimento no Exterior
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'investimentosExterior')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'investimentosExterior')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['INVESTIMENTO_EXTERIOR']}')]     #opções disponíveis (Não se aplica / Até 20% / Até 40%)
    
    # Campo Percentual Permitido em Investimento no Exterior
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'percentualAutorizadoInvestimentoExterior')]    
    Run Keyword If    ${passed}==True    Commons.Wait And Input    //input[contains(@name,'percentualAutorizadoInvestimentoExterior')]    ${dados['Classe']['PerfilDaClasse']['PERCENTUAL_PERMITIDO_INVESTIMENTO_EXTERIOR']}
    
    # Campo Indicador Limites por Emissor e Ativo
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'indicadorLimitesPorEmissorAtivo')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'indicadorLimitesPorEmissorAtivo')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['INDICADOR_LIMITES_POR_EMISSOR_ATIVO']}')]  
    
    # Campo Foco de Atuação
    ${passed}=    Run Keyword And Return Status    
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'focoAtuacao')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'focoAtuacao')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['FOCO_ATUACAO']}')]
    
    # Campo Fundo ESG
    ${passed}=    Run Keyword And Return Status    
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'fundoEsg')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'fundoEsg')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['FUNDO_ESG']}')]
    
    Sleep    1s
    
    # Campo Forma de Condomínio
    ${passed}=    Run Keyword And Return Status    
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'formaCondominio')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'formaCondominio')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['FORMA_CONDOMINIO']}')]
    
    # Campo Infraestrutura
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'indicadorFundoInfraestrutura')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'indicadorFundoInfraestrutura')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['INFRAESTRUTURA']}')]
    
    # Campo Criptoativos é 1 ou 2 Maior Risco da Carteira?
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'criptoativosMaiorRiscoDaCarteira')]
    Commons.Combo    //div[contains(@aria-labelledby,'criptoativosMaiorRiscoDaCarteira')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['CRIPTOATIVOS_MAIOR_RISCO_CARTEIRA']}')]
    
    
    # Campo Porcentagem Permitido em Criptoativos
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'porcentagemPermitidoEmCriptoativos')]
    Run Keyword If    ${passed}==True    Commons.Wait And Input    //input[contains(@name,'porcentagemPermitidoEmCriptoativos')]    ${dados['Classe']['PerfilDaClasse']['PORCENTAGEM_PERMITIDO_CRIPTOATIVOS']}
    
    # Campo Prazo de Duração
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'prazoDuracao')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'prazoDuracao')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['PRAZO_DURACAO']}')]
    
    # Campo Duração em Meses
    ${passed}=    Run Keyword And Return Status    
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'duracaoMeses')]
    Run Keyword If    ${passed}==True    Commons.Wait And Input    //input[contains(@name,'duracaoMeses')]    ${dados['Classe']['PerfilDaClasse']['DURACAO_MESES']}
    
    # Campo Comite de Investimento
    ${passed}=    Run Keyword And Return Status    
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'comiteInvestimento')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'comiteInvestimento')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['COMITE_INVESTIMENTO']}')]
    
    # Campo Membros do Comite de Investimento representados pelos cotistas?
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'membrosComiteInvestimento')]    
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'membrosComiteInvestimento')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['MEMBROS_COMITE_INVESTIMENTO']}')]
    
    # Campo Entidade de Investimento
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'entidadeDeInvestimento')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'entidadeDeInvestimento')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['ENTIDADE_INVESTIMENTO']}')]
    
    # Campo Responsabilidade Limitada
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'responsabilidadeLimitada')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['RESPONSABILIDADE_LIMITADA']}')]
    
    # Campo Tipo de Cessão
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'tipoCessao')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'tipoCessao')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['TIPO_CESSAO']}')]
    
    # Campo Recompra
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'recompra')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'recompra')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['RECOMPRA']}')]
    
    # Campo Cooberigacao
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'coobrigacao')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'coobrigacao')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['COOBRIGACAO']}')]
    
    # Campo Seguro
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'seguro')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'seguro')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['SEGURO']}')]
    
    # Campo Direito Creditorio
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'direitoCreditorio')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'direitoCreditorio')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['DIREITO_CREDITORIO']}')]
    
    # Campo Originador
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'originador')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'originador')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['ORIGINADOR']}')]
    
    # Campo Cedente
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'cedente')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'cedente')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['CEDENTE']}')]
    
    # Campo Sacado
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'sacado')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'sacado')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['SACADO']}')]
    
    # Campo 95% Em Fundos Isentos Come-Cotas
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'fundosIsentosComeCotas')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[@aria-labelledby='fundosIsentosComeCotas']    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['FUNDOS_ISENTOS_COM_COTAS']}')]
    
    # Campo Entidade de Investimento para fins Tributários
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'entidadeDeInvestTrib')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'entidadeDeInvestTrib')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['ENTIDADE_INVESTIMENTO_FINS_TRIBUTARIOS']}')]
    
    # Campo FIAGRO
    ${passed}=    Run Keyword And Return Status
    ...    SeleniumLibrary.Element Should Be Enabled    //input[contains(@name,'fiagro')]
    Run Keyword If    ${passed}==True    Commons.Combo    //div[contains(@aria-labelledby,'fiagro')]    //li[contains(.,'${dados['Classe']['PerfilDaClasse']['FIAGRO']}')]

    Commons.Wait And Click    //button[contains(.,'Próximo')]   

#     IF    "${dados['Classe']['PerfilDaClasse']['CATEGORIA_ANBIMA']}" == "Previdência"
#         Commons.Wait And Click    //div[contains(@aria-labelledby,'tipoAnbima')]
#         SeleniumLibrary.Scroll Element Into View    //li[contains(.,'${TYPE_ANBIMA}')]
#         Commons.Wait And Click    //li[contains(.,'${TYPE_ANBIMA}')]
#     ELSE IF    "${dados['Classe']['PerfilDaClasse']['CATEGORIA_ANBIMA']}" == "FII"
#         Commons.Wait And Click    //div[contains(@aria-labelledby,'tipoAnbima')]
#         SeleniumLibrary.Scroll Element Into View    //li[contains(.,'${TYPE_ANBIMA}')]
#         Commons.Wait And Click    //li[contains(.,'${TYPE_ANBIMA}')]        
#     ELSE
#         Commons.Wait And Click    //div[contains(@aria-labelledby,'tipoAnbima')]
#         SeleniumLibrary.Scroll Element Into View    //li[contains(.,'${TYPE_ANBIMA}')]
#         Commons.Wait And Click    //li[contains(.,'${TYPE_ANBIMA}')]        
#         Sleep    4s
#     END
#     IF    "${dados['Classe']['PerfilDaClasse']['CATEGORIA_ANBIMA']}" == "ETF"
#         Validar exigencia de categorias anbima vazia
#         Preencher restante do perfil da classe ETF V13
#     ELSE IF    "${dados['Classe']['PerfilDaClasse']['CATEGORIA_ANBIMA']}" == "Offshore"
#         Validar exigencia de categorias anbima vazia
#         Preencher restante do perfil da classe Offshore V13
#     ELSE IF    "${dados['Classe']['PerfilDaClasse']['CATEGORIA_ANBIMA']}" == "Ações"
#         Perfil-Classe.Validar exigencia de categorias anbima    ${CAT_N1}    ${CAT_N2}
#         Perfil-Classe.Preencher restante do perfil da classe acao Investimento Exterior V13
#     ELSE IF    "${dados['Classe']['PerfilDaClasse']['CATEGORIA_ANBIMA']}" == "Multimercado"
#         Validar exigencia de categorias anbima    ${CAT_N1}    ${CAT_N2}
#         Perfil-Classe-Multimercado.Preencher Perfil Classe Multimercado
#     ELSE IF    "${dados['Classe']['PerfilDaClasse']['CATEGORIA_ANBIMA']}" == "Previdência"
#         Validar exigencia de categorias anbima    ${CAT_N1}    ${CAT_N2}
#         Preencher restante do perfil da classe RF Previdenciario
#     ELSE IF    "${dados['Classe']['PerfilDaClasse']['CATEGORIA_ANBIMA']}" == "Renda Fixa"
#         Validar exigencia de categorias anbima    ${CAT_N1}    ${CAT_N2}
#         Preencher restante do perfil da classe RF Investimento Exterior
#     ELSE IF    "${dados['Classe']['PerfilDaClasse']['CATEGORIA_ANBIMA']}" == "FIP"
#         Validar exigencia de categorias anbima vazia
#         Preencher restante do perfil da classe FIP V13
#     ELSE IF    "${dados['Classe']['PerfilDaClasse']['CATEGORIA_ANBIMA']}" == "FII"
#         Validar exigencia de categorias anbima vazia
#         Preencher restante do perfil da classe FII V13
#     ELSE IF    "${dados['Classe']['PerfilDaClasse']['CATEGORIA_ANBIMA']}" == "FIDC"
#         Validar exigencia de categorias anbima vazia
#         Preencher restante do perfil da classe FIDC V13
#     ELSE
#         Validar exigencia de categorias anbima    ${CAT_N1}    ${CAT_N2}
#         Preencher restante do perfil da classe
#     END
#     Commons.Wait And Click    //button[contains(.,'Próximo')]    


# Validar exigencia de categorias anbima vazia
#     [Documentation]    Definir as duas categorias ANBIMA vazia que deseja ser validado.
#     Commons.Visivel    //input[@name='categoriaAnbimaNivelII'][@value='']
#     Commons.Visivel    //input[@name='categoriaAnbimaNivelIII'][@value='']


# Validar exigencia de categorias anbima
#     [Documentation]    Definir as duas categorias ANBIMA que deseja ser validao.
#     [Arguments]    ${CAT_N1}    ${CAT_N2}
#     ${CAT_N1}    Convert To Upper Case    ${CAT_N1}
#     ${CAT_N2}    Convert To Upper Case    ${CAT_N2}
#     Log    ${CAT_N1} & ${CAT_N2}
#     Commons.Visivel    //input[@name='categoriaAnbimaNivelII'][@value='${CAT_N1}']
#     Commons.Visivel    //input[@name='categoriaAnbimaNivelIII'][@value='${CAT_N2}']


# Preencher restante do perfil da classe
#     Commons.Combo    //div[contains(@aria-labelledby,'composicaoFundo')]    //li[contains(.,'FI')]
#     Commons.Combo    //div[contains(@aria-labelledby,'tributacaoPerseguida')]    //li[contains(.,'Renda Variável')]
#     Commons.Combo    //div[contains(@aria-labelledby,'fundoAlavancado')]    //li[contains(.,'Não')]
#     Commons.Combo    //div[contains(@aria-labelledby,'multiGestor')]    //li[contains(.,'Multigestor')]
#     Commons.Combo    //div[contains(@aria-labelledby,'derivativos')]    //li[contains(.,'Permitido')]
#     Commons.Combo    //div[contains(@aria-labelledby,'possuiBenchmark')]    //li[contains(.,'Sim')]    
#     Commons.Wait And Click    //div[contains(@aria-labelledby,'benchmark')]
#     SeleniumLibrary.Scroll Element Into View    //li[contains(.,'EURO')]
#     SeleniumLibrary.Click Element    //li[contains(.,'EURO')]

#     Commons.Combo    //div[contains(@aria-labelledby,'creditoPrivado')]    //li[contains(.,'Não')]
#     Commons.Wait And Input    //input[contains(@name,'percentualCreditoPrivado')]    10
#     Commons.Combo    //div[contains(@aria-labelledby,'investimentosExterior')]    //li[contains(.,'Não se aplica')]
#     Commons.Combo    //div[contains(@aria-labelledby,'indicadorLimitesPorEmissorAtivo')]    //li[contains(.,'Não se aplica')]  
#     Commons.Combo    //div[contains(@aria-labelledby,'focoAtuacao')]    //li[contains(.,'Não se aplica')]
#     Commons.Combo    //div[contains(@aria-labelledby,'fundoEsg')]    //li[contains(.,'Não')]
#     Sleep    1s
#     Commons.Combo    //div[contains(@aria-labelledby,'formaCondominio')]    //li[contains(.,'Aberto')]
#     Commons.Combo    //div[contains(@aria-labelledby,'indicadorFundoInfraestrutura')]    //li[contains(.,'Não se aplica')]
#     Commons.Combo    //div[contains(@aria-labelledby,'criptoativosMaiorRiscoDaCarteira')]    //li[contains(.,'Não')]
#     Commons.Combo    //div[contains(@aria-labelledby,'prazoDuracao')]    //li[contains(.,'Indeterminado')]
#     Commons.Combo    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]    //li[contains(.,'Não')]

# Preencher restante do perfil da classe RF Previdenciario
#     Commons.Combo    //div[contains(@aria-labelledby,'composicaoFundo')]    //li[contains(.,'FM')]
#     Commons.Combo    //div[contains(@aria-labelledby,'tributacaoPerseguida')]    //li[contains(.,'Previdenciário')]
#     Commons.Combo    //div[contains(@aria-labelledby,'fundoAlavancado')]    //li[contains(.,'Não')]
#     Commons.Combo    //div[contains(@aria-labelledby,'multiGestor')]    //li[contains(.,'Multigestor')]
#     Commons.Combo    //div[contains(@aria-labelledby,'derivativos')]    //li[contains(.,'Permitido')]
#     Commons.Combo    //div[contains(@aria-labelledby,'possuiBenchmark')]    //li[contains(.,'Não')]
#     Commons.Combo    //div[contains(@aria-labelledby,'creditoPrivado')]    //li[contains(.,'Sim')]
#     Commons.Wait And Input    //input[contains(@name,'percentualCreditoPrivado')]    50,01
#     Commons.Combo    //div[contains(@aria-labelledby,'investimentosExterior')]    //li[contains(.,'Até 100%')]
#     Commons.Wait And Input    //input[contains(@name,'percentualAutorizadoInvestimentoExterior')]    40
#     Commons.Combo    //div[contains(@aria-labelledby,'indicadorLimitesPorEmissorAtivo')]    //li[contains(.,'Não se aplica')]  
#     Commons.Combo    //div[contains(@aria-labelledby,'focoAtuacao')]    //li[contains(.,'Não se aplica')]
#     Commons.Combo    //div[contains(@aria-labelledby,'fundoEsg')]    //li[contains(.,'Não')]
#     Sleep    1s
#     Commons.Combo    //div[contains(@aria-labelledby,'formaCondominio')]    //li[contains(.,'Fechado')]
#     Commons.Combo    //div[contains(@aria-labelledby,'indicadorFundoInfraestrutura')]    //li[contains(.,'Não')]
#     Commons.Combo    //div[contains(@aria-labelledby,'criptoativosMaiorRiscoDaCarteira')]    //li[contains(.,'Não')]
#     Commons.Combo    //div[contains(@aria-labelledby,'prazoDuracao')]    //li[contains(.,'Indeterminado')]
#     Commons.Combo    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]    //li[contains(.,'Não')]

# Preencher restante do perfil da classe Offshore V13
#     Commons.Combo    //div[contains(@aria-labelledby,'composicaoFundo')]    //li[contains(.,'CIC')]       #opções disponíveis (CI /CIC / CICPC/ CIPC)
#          #opções disponíveis (Longo Prazo /Curto Prazo / Alícota de 15%/ Não Aplicável/ Outros/ Insento)
#     Commons.Combo    //div[contains(@aria-labelledby,'fundoAlavancado')]    //li[contains(.,'Não')]     #sem seleção    
#     Commons.Combo    //div[contains(@aria-labelledby,'derivativos')]    //li[contains(.,'Permitido')]
#     Sleep    1s
#     Commons.Combo    //div[contains(@aria-labelledby,'formaCondominio')]    //li[contains(.,'Aberto')]
#     Commons.Combo    //div[contains(@aria-labelledby,'criptoativosMaiorRiscoDaCarteira')]    //li[contains(.,'Não')]
#     Commons.Combo    //div[contains(@aria-labelledby,'prazoDuracao')]    //li[contains(.,'Indeterminado')]
#     Sleep    2s
#     SeleniumLibrary.Scroll Element Into View    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]
#     Commons.Combo    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]    //li[contains(.,'Não')]
#     Commons.Combo    //div[@aria-labelledby='fundosIsentosComeCotas']    //li[contains(.,'Sim')]


# Preencher restante do perfil da classe acao Investimento Exterior V13
#     GlobalKeywords.Combo    //div[contains(@aria-labelledby,'composicaoFundo')]    //li[contains(.,'CI')]       #opções disponíveis (CI /CIC / CICPC/ CIPC)
#     #GlobalKeywords.Combo    //div[contains(@aria-labelledby,'tributacaoPerseguida')]    //li[contains(.,'Alícota de 15%')]     # campo ja vem com informação opções disponíveis (Longo Prazo /Curto Prazo / Alícota de 15%/ Não Aplicável/ Outros/ Insento)
    # GlobalKeywords.Combo    //div[contains(@aria-labelledby,'fundoAlavancado')]    //li[contains(.,'Não')]
#     GlobalKeywords.Combo    //div[contains(@aria-labelledby,'derivativos')]    //li[contains(.,'Permitido')]
#     GlobalKeywords.Combo    //div[contains(@aria-labelledby,'possuiBenchmark')]    //li[contains(.,'Sim')]
#     GlobalKeywords.Wait And Click    //div[contains(@aria-labelledby,'benchmark')]            #opções disponíveis (CDI /CDI 30X30 / DÓLAR COMERCIAL/ DÓLAR PTAX/ EURO)
#     SeleniumLibrary.Scroll Element Into View    //p[contains(.,'EURO')]
#     SeleniumLibrary.Click Element    //p[contains(.,'EURO')]
#     SeleniumLibrary.Press Keys    None    TAB
#     # GlobalKeywords.Combo    //div[contains(@aria-labelledby,'creditoPrivado')]    //li[contains(.,'Não')]    ### campo ja vem com informação
#     GlobalKeywords.Wait And Input    //input[contains(@name,'percentualCreditoPrivado')]    40   #//input[contains(@name,'percentualCreditoPrivado')]
#     Sleep    3s
#     GlobalKeywords.Combo    //div[contains(@aria-labelledby,'investimentosExterior')]    //li[contains(.,'Até 40%')]     #opções disponíveis (Não se aplica / Até 20% / Até 40%)
#     GlobalKeywords.Wait And Input    //input[contains(@name,'percentualAutorizadoInvestimentoExterior')]    40
#     GlobalKeywords.Combo    //div[contains(@aria-labelledby,'indicadorLimitesPorEmissorAtivo')]    //li[contains(.,'Não se aplica')]  
#     #GlobalKeywords.Combo    //div[contains(@aria-labelledby,'focoAtuacao')]    //li[contains(.,'Não se aplica')]
#     GlobalKeywords.Combo    //div[contains(@aria-labelledby,'fundoEsg')]    //li[contains(.,'Não')]
#     Sleep    1s
#     GlobalKeywords.Combo    //div[contains(@aria-labelledby,'formaCondominio')]    //li[contains(.,'Fechado')]
#     GlobalKeywords.Combo    //div[contains(@aria-labelledby,'criptoativosMaiorRiscoDaCarteira')]    //li[contains(.,'Não')]
#     GlobalKeywords.Wait And Input    //input[contains(@name,'porcentagemPermitidoEmCriptoativos')]    10
#     GlobalKeywords.Combo    //div[contains(@aria-labelledby,'prazoDuracao')]    //li[contains(.,'Indeterminado')]
#     GlobalKeywords.Combo    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]    //li[contains(.,'Não')]
#     GlobalKeywords.Combo    //div[@aria-labelledby='fundosIsentosComeCotas']    //li[contains(.,'Sim')]        #em branco