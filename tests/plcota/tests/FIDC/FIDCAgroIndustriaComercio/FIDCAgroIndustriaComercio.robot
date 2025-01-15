*** Settings ***
Documentation       Essa automação valida a variação de rentabilidade do tipo anbima: FIDC Agro, Indústria e Comércio
...    Para preenchimento das datas, utilize o arquivo que esta no caminho:
...    resources/data/datas_informes.yaml
...    utilize as variáveis dessa forma: 
...    DIA -> ${dataInicial.DIA} o dia que vc quiser  
...    MES -> ${MES} como a data pode variar, mantenho em um unico mes, passivel de mudança.
...    ANO -> ${ANO} manter o ano vigente

Resource            ../../../../../main.robot

Test Setup          Navegador-Config.Abrir o navegador
Test Teardown       Navegador-Config.Fechar o navegador

*** Test Cases ***
[PL/Cota] Envio de informe inicial do tipo FIDC Agro, Indústria e Comércio
    [Tags]    informe    fidcagroindustriaecomercio    inicial
    Login.Acessar o HUB    ${EMAIL}
    Profile.Alterar o perfil    Administrador    BTG PACTUAL    1
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro PLCota inicial para limites
    # ...    TIPO_ANBIMA=Agro, Indústria e Comércio
    ...    DIA=${dataInicial.DIA}    MES=${MES}    ANO=${ANO}
    ...    COD_SCLASSE=S0000631639
    ...    COTA=773,8768395
    ...    PATRIMONIO=77387683,95
    ...    COTISTA=1
    Validar-Processamento.Validar processamento do informe inicial
    
[PL/Cota] Envio de informe validando o limite superior externo da rentabilidade do tipo FIDC Agro, Indústria e Comércio
    [Tags]    informe    fidcagroindustriaecomercio    superiorexterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Superior Externo
    ...    DIA=${superiorExterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=3.10    
    ...    COD_SCLASSE=S0000287296
    Validar-Processamento.Validar processamento do informe de rentabilidade    Possiveis Inconsistencias

[PL/Cota] Envio de informe validando o limite superior interno da rentabilidade do tipo FIDC Agro, Indústria e Comércio
    [Tags]    informe    fidcagroindustriaecomercio    superiorinterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Superior Interno    
    ...    DIA=${superiorInterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=3.08    
    ...    COD_SCLASSE=S0000287296
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior interno da rentabilidade do tipo FIDC Agro, Indústria e Comércio
    [Tags]    informe    fidcagroindustriaecomercio    inferiorinterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Inferior Interno    
    ...    DIA=${inferiorInterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=-3.08    
    ...    COD_SCLASSE=S0000287296
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior externo da rentabilidade do tipo FIDC Agro, Indústria e Comércio
    [Tags]    informe    fidcagroindustriaecomercio    inferiorexterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Inferior Externo
    ...    DIA=${inferiorExterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=-3.10    
    ...    COD_SCLASSE=S0000287296
    Validar-Processamento.Validar processamento do informe de rentabilidade    Possiveis Inconsistencias

[PL/Cota] Envio de informe validando o limite médio da rentabilidade do tipo FIDC Agro, Indústria e Comércio
    [Tags]    informe    fidcagroindustriaecomercio    medio
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Limite Medio
    ...    DIA=${limiteMedio.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=
    ...    COD_SCLASSE=S0000287296
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado
