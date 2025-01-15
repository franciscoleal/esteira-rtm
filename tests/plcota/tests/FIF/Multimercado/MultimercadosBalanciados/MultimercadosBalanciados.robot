*** Settings ***
Documentation       Essa automação valida a variação de rentabilidade do tipo anbima: multimercado balanciados

Resource            ../../../../../../main.robot

Test Setup          Navegador-Config.Abrir o navegador
Test Teardown       Navegador-Config.Fechar o navegador

*** Test Cases ***
[PL/Cota] Envio de informe inicial do tipo multimercado balanciados
    [Tags]    informe    multimercadobalanciados    inicial
    Login.Acessar o HUB    ${EMAIL}
    Profile.Alterar o perfil    Administrador    BEM DTVM    1
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro PLCota inicial para limites
    ...    DIA=${dataInicial.DIA}    MES=${MES}    ANO=${ANO}     
    ...    COD_SCLASSE=C0000590126    
    ...    COTA=1,33867621    
    ...    PATRIMONIO=2149520317,22
    ...    COTISTA=1
    Validar-Processamento.Validar processamento do informe inicial
    
[PL/Cota] Envio de informe validando o limite superior externo da rentabilidade do tipo multimercado balanciados
    [Tags]    informe    multimercadobalanciados    superiorexterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota "Superior Externo"    
    ...    DIA=${superiorExterno.DIA}    MES=${MES}    ANO=${ANO}    
    ...    PERCENT=3.3    
    ...    COD_SCLASSE=C0000137601
    Validar-Processamento.Validar processamento do informe de rentabilidade    Possiveis Inconsistencias

[PL/Cota] Envio de informe validando o limite superior interno da rentabilidade do tipo multimercado balanciados
    [Tags]    informe    multimercadobalanciados    superiorinterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota "Superior Interno"    
    ...    DIA=${superiorInterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=3.1    
    ...    COD_SCLASSE=C0000137601
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior interno da rentabilidade do tipo multimercado balanciados
    [Tags]    informe    multimercadobalanciados    inferiorinterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota "Inferior Interno"    
    ...    DIA=${inferiorInterno.DIA}    MES=${MES}    ANO=${ANO}  
    ...    PERCENT=-3.1    
    ...    COD_SCLASSE=C0000137601
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado    

[PL/Cota] Envio de informe validando o limite inferior externo da rentabilidade do tipo multimercado balanciados
    [Tags]    informe    multimercadobalanciados    inferiorexterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota "Inferior Externo"    
    ...    DIA=${inferiorExterno.DIA}    MES=${MES}    ANO=${ANO}     
    ...    PERCENT=-3.3    
    ...    COD_SCLASSE=C0000137601
    Validar-Processamento.Validar processamento do informe de rentabilidade    Possiveis Inconsistencias

[PL/Cota] Envio de informe validando o limite médio da rentabilidade do tipo multimercado balanciados
    [Tags]    informe    multimercadobalanciados    medio
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota "Limite Medio"    
    ...    DIA=${limiteMedio.DIA}    MES=${MES}    ANO=${ANO}    
    ...    PERCENT=1   
    ...    COD_SCLASSE=C0000137601
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado
