*** Settings ***
Documentation       Essa automação valida a variação de rentabilidade do tipo anbima: multimercados investimento no exterior

Resource            ../../../../../../main.robot

Test Setup          Navegador-Config.Abrir o navegador
Test Teardown       Navegador-Config.Fechar o navegador


*** Test Cases ***
[PL/Cota] Envio de informe inicial do tipo multimercados investimento no exterior
    [Tags]    informe    multimercadosinvestimentonoexterior    inicial
    Login.Acessar o HUB    ${EMAIL}
    Profile.Alterar o perfil    Administrador    ITAU    1
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro PLCota inicial para limites    
    ...    DIA=${dataInicial.DIA}    MES=${MES}    ANO=${ANO}
    ...    COD_SCLASSE=${COD_CLASSES}    
    ...    COTA=1583,17    
    ...    PATRIMONIO=59788054,95  
    ...    COTISTA=1
    Validar-Processamento.Validar processamento do informe inicial

[PL/Cota] Envio de informe validando o limite superior externo da rentabilidade do tipo multimercados investimento no exterior
    [Tags]    informe    multimercadosinvestimentonoexterior    superiorexterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Superior Externo
    ...    DIA=${superiorExterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=3.25    
    ...    COD_SCLASSE=${COD_CLASSES}
    Validar-Processamento.Validar processamento do informe de rentabilidade    Possiveis Inconsistencias

[PL/Cota] Envio de informe validando o limite superior interno da rentabilidade do tipo multimercados investimento no exterior
    [Tags]    informe    multimercadosinvestimentonoexterior    superiorinterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Superior Interno
    ...    DIA=${superiorInterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=3.23
    ...    COD_SCLASSE=${COD_CLASSES}
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior interno da rentabilidade do tipo multimercados investimento no exterior    
    [Tags]    informe    multimercadosinvestimentonoexterior    inferiorinterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Inferior Interno
    ...    DIA=${inferiorInterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=-3.23
    ...    COD_SCLASSE=${COD_CLASSES}
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior externo da rentabilidade do tipo multimercados investimento no exterior
    [Tags]    informe    multimercadosinvestimentonoexterior    inferiorexterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Inferior Externo
    ...    DIA=${inferiorExterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=-3.25
    ...    COD_SCLASSE=${COD_CLASSES}
    Validar-Processamento.Validar processamento do informe de rentabilidade    Possiveis Inconsistencias    

[PL/Cota] Envio de informe validando o limite médio da rentabilidade do tipo multimercados investimento no exterior
    [Tags]    informe    multimercadosinvestimentonoexterior    medio
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Limite Medio
    ...    DIA=${limiteMedio.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=1
    ...    COD_SCLASSE=${COD_CLASSES}
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado
