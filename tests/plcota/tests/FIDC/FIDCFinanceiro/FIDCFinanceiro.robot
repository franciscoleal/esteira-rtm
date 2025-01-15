*** Settings ***
Documentation       Essa automação valida a variação de rentabilidade do tipo anbima: FIDC financeiro

Resource            ../../../../../main.robot

Test Setup          Navegador-Config.Abrir o navegador
Test Teardown       Navegador-Config.Fechar o navegador


*** Test Cases ***
[PL/Cota] Envio de informe inicial do tipo FIDC financeiro
    [Tags]    informe    fidcfinanceiro    inicial
    Login.Acessar o HUB    ${EMAIL}
    Profile.Alterar o perfil    Administrador    BTG PACTUAL SERVICOS FINANCEIROS SA DTVM    1
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro PLCota inicial para limites
    ...    DIA=${dataInicial.DIA}    MES=${MES}    ANO=${ANO} 
    ...    COD_SCLASSE=S0000339180
    ...    COTA=1000
    ...    PATRIMONIO=100000,00
    ...    COTISTA=1
    Validar-Processamento.Validar processamento do informe inicial

[PL/Cota] Envio de informe validando o limite superior externo da rentabilidade do tipo FIDC financeiro
    [Tags]    informe    fidcfinanceiro    superiorexterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Superior Externo
    ...    DIA=${superiorExterno.DIA}    MES=${MES}    ANO=${ANO}      
    ...    PERCENT=3.7    
    ...    COD_SCLASSE=S0000339180
    Validar-Processamento.Validar processamento do informe de rentabilidade    Possiveis Inconsistencias

[PL/Cota] Envio de informe validando o limite superior interno da rentabilidade do tipo FIDC financeiro
    [Tags]    informe    fidcfinanceiro    superiorinterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Superior Interno   
    ...    DIA=${superiorInterno.DIA}    MES=${MES}    ANO=${ANO}  
    ...    PERCENT=3.68    
    ...    COD_SCLASSE=S0000339180
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior externo da rentabilidade do tipo FIDC financeiro
    [Tags]    informe    fidcfinanceiro    inferiorexterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Inferior Externo
    ...    DIA=${inferiorInterno.DIA}    MES=${MES}    ANO=${ANO}      
    ...    PERCENT=-3.68    
    ...    COD_SCLASSE=S0000339180
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior interno da rentabilidade do tipo FIDC financeiro
    [Tags]    informe    fidcfinanceiro    inferiorinterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Inferior Interno
    ...    DIA=${inferiorExterno.DIA}    MES=${MES}    ANO=${ANO}    
    ...    PERCENT=-3.7    
    ...    COD_SCLASSE=S0000339180
    Validar-Processamento.Validar processamento do informe de rentabilidade    Possiveis Inconsistencias

[PL/Cota] Envio de informe validando o limite médio da rentabilidade do tipo FIDC financeiro
    [Tags]    informe    fidcfinanceiro    medio
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Limite Medio
    ...    DIA=${limiteMedio.DIA}    MES=${MES}    ANO=${ANO} 
    ...    PERCENT=1
    ...    COD_SCLASSE=S0000339180
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado
