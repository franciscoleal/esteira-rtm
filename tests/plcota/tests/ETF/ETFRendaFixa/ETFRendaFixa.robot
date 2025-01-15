*** Settings ***
Documentation       Essa automação valida a variação de rentabilidade do tipo anbima: ETF renda fixa

Resource            ../../../../../main.robot

Test Setup          Navegador-Config.Abrir o navegador
Test Teardown       Navegador-Config.Fechar o navegador


*** Test Cases ***

[PL/Cota] Envio de informe inicial do tipo ETF renda fixa
    [Tags]    informe    etfrendafixa    inicial
    Login.Acessar o HUB    ${EMAIL}    ${LINK_HUB_UAT}
    Profile.Alterar o perfil    Administrador    ITAU    1
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro PLCota inicial para limites
    ...    DIA=${dataInicial.DIA}    MES=${MES}    ANO=${ANO}   
    ...    COD_SCLASSE=${COD_CLASSES}   
    ...    COTA=100,783808    
    ...    PATRIMONIO=2136616708,5  
    ...    COTISTA=8.640
    Validar-Processamento.Validar processamento do informe inicial

[PL/Cota] Envio de informe validando o limite superior externo da rentabilidade do tipo ETF renda fixa
    [Tags]    informe    etfrendafixa    superiorexterno
    Login.Acessar o HUB    ${EMAIL}    ${LINK_HUB_UAT}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Superior Externo
    ...    DIA=${superiorExterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=3.12    
    ...    COD_SCLASSE=${COD_CLASSES}
    Validar-Processamento.Validar processamento do informe de rentabilidade    Possiveis Inconsistencias

[PL/Cota] Envio de informe validando o limite superior interno da rentabilidade do tipo ETF renda fixa
    [Tags]    informe    etfrendafixa    superiorinterno
    Login.Acessar o HUB    ${EMAIL}    ${LINK_HUB_UAT}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Superior Interno    
    ...    DIA=18    MES=07    ANO=2024
    ...    PERCENT=3.10    
    ...    COD_SCLASSE=${COD_CLASSES}
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior interno da rentabilidade do tipo ETF renda fixa
    [Tags]    informe    etfrendafixa    inferiorinterno
    Login.Acessar o HUB    ${EMAIL}    ${LINK_HUB_UAT}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Inferior Externo
    ...    DIA=${inferiorInterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=-3.12    
    ...    COD_SCLASSE=${COD_CLASSES}
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado     

[PL/Cota] Envio de informe validando o limite inferior externo da rentabilidade do tipo ETF renda fixa
    [Tags]    informe    etfrendafixa    inferiorexterno
    Login.Acessar o HUB    ${EMAIL}    ${LINK_HUB_UAT}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Inferior Interno
    ...    DIA=${inferiorExterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=-3.10    
    ...    COD_SCLASSE=${COD_CLASSES}
    Validar-Processamento.Validar processamento do informe de rentabilidade    Possiveis Inconsistencias

[PL/Cota] Envio de informe validando o limite médio da rentabilidade do tipo ETF renda fixa
    [Tags]    informe    etfrendafixa    medio
    Login.Acessar o HUB    ${EMAIL}    ${LINK_HUB_UAT}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Limite Medio
    ...    DIA=${limiteMedio.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=1    
    ...    COD_SCLASSE=${COD_CLASSES}
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado
