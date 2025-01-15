*** Settings ***
Documentation       Essa automação valida a variação de rentabilidade do tipo anbima: FIDIC outros

Resource            ../../../../../main.robot

Test Setup          Navegador-Config.Abrir o navegador
Test Teardown       Navegador-Config.Fechar o navegador


*** Test Cases ***
[PL/Cota] Envio de informe inicial do tipo FIDIC outros
    [Tags]    informe    fidicoutros    inicial
    Login.Acessar o HUB    ${EMAIL}
    Profile.Alterar o perfil    Administrador    ITAU UNIBANCO SA    1
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro PLCota inicial para limites
    ...    DIA=${dataInicial.DIA}    MES=${MES}    ANO=${ANO}
    ...    COD_SCLASSE=S0001213083
    ...    COTA=1000
    ...    PATRIMONIO=100000,00
    ...    COTISTA=1
    Validar-Processamento.Validar processamento do informe inicial

[PL/Cota] Envio de informe validando o limite superior externo da rentabilidade do tipo FIDIC outros
    [Tags]    informe    fidicoutros    superiorexterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Superior externo
    ...    DIA=${superiorExterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=3.54    
    ...    COD_SCLASSE=S0001213083
    Validar-Processamento.Validar processamento do informe de rentabilidade    Possiveis Inconsistencias

[PL/Cota] Envio de informe validando o limite superior interno da rentabilidade do tipo FIDIC outros
    [Tags]    informe    fidicoutros    superiorinterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Superior interno
    ...    DIA=${superiorInterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=3.52
    ...    COD_SCLASSE=S0001213083
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior interno da rentabilidade do tipo FIDIC outros
    [Tags]    informe    fidicoutros    inferiorinterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Inferior interno
    ...    DIA=${inferiorInterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=-3.53
    ...    COD_SCLASSE=S0001213083
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior externo da rentabilidade do tipo FIDIC outros
    [Tags]    informe    fidicoutros    inferiorexterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Inferior Externo
    ...    DIA=${inferiorExterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=-3.52    
    ...    COD_SCLASSE=S0001213083
    Validar-Processamento.Validar processamento do informe de rentabilidade    Possiveis Inconsistencias    

[PL/Cota] Envio de informe validando o limite médio da rentabilidade do tipo FIDIC outros
    [Tags]    informe    fidicoutros    medio
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Limite Medio
    ...    DIA=${limiteMedio.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=1    
    ...    COD_SCLASSE=S0001213083
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado
