*** Settings ***
Documentation       Essa automação valida a variação de rentabilidade do tipo anbima: FIDC fomento mercantil

Resource            ../../../../../main.robot

Test Setup          Navegador-Config.Abrir o navegador
Test Teardown       Navegador-Config.Fechar o navegador

*** Test Cases ***
[PL/Cota] Envio de informe inicial do tipo FIDC fomento mercantil
    [Tags]    informe    fidcfomentomercantil    inicial
    Login.Acessar o HUB    ${EMAIL}
    Profile.Alterar o perfil    Administrador    BTG PACTUAL SERVICOS FINANCEIROS SA DTVM    1
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro PLCota inicial para limites
    ...    DIA=${dataInicial.DIA}    MES=${MES}    ANO=${ANO}    
    ...    COD_SCLASSE=S0000424374
    ...    COTA=1000
    ...    PATRIMONIO=100000,00
    ...    COTISTA=1
    Validar-Processamento.Validar processamento do informe inicial

[PL/Cota] Envio de informe validando o limite superior externo da rentabilidade do tipo FIDC fomento mercantil
    [Tags]    informe    fidcfomentomercantil    superiorexterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Superior Externo
    ...    DIA=${superiorExterno.DIA}    MES=${MES}    ANO=${ANO}    
    ...    PERCENT=3.71    
    ...    COD_SCLASSE=S0000424374
    Validar-Processamento.Validar processamento do informe de rentabilidade    Possiveis Inconsistencias

[PL/Cota] Envio de informe validando o limite superior interno da rentabilidade do tipo FIDC fomento mercantil
    [Tags]    informe    fidcfomentomercantil    superiorinterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Superior Interno    
    ...    DIA=${superiorInterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=3.69    
    ...    COD_SCLASSE=S0000424374
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior interno da rentabilidade do tipo FIDC fomento mercantil
    [Tags]    informe    fidcfomentomercantil    inferiorinterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Inferior Interno
    ...    DIA=${inferiorInterno.DIA}    MES=${MES}    ANO=${ANO}    
    ...    PERCENT=-3.71    
    ...    COD_SCLASSE=S0000424374
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior externo da rentabilidade do tipo FIDC fomento mercantil
    [Tags]    informe    fidcfomentomercantil    inferiorexterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Inferior Externo
    ...    DIA=${inferiorExterno.DIA}    MES=${MES}    ANO=${ANO}   
    ...    PERCENT=-3.69    
    ...    COD_SCLASSE=S0000424374
    Validar-Processamento.Validar processamento do informe de rentabilidade    Possiveis Inconsistencias

[PL/Cota] Envio de informe validando o limite médio da rentabilidade do tipo FIDC fomento mercantil
    [Tags]    informe    fidcfomentomercantil    medio
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Limite Medio   
    ...    DIA=${limiteMedio.DIA}    MES=${MES}    ANO=${ANO} 
    ...    PERCENT=1    
    ...    COD_SCLASSE=S0000424374
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado
