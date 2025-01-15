*** Settings ***
Documentation       Essa automação valida a variação de rentabilidade do tipo anbima: multimercados capital protegido

Resource            ../../../../../../main.robot

Test Setup          Navegador-Config.Abrir o navegador
Test Teardown       Navegador-Config.Fechar o navegador


*** Test Cases ***
[PL/Cota] Envio de informe inicial do tipo multimercados capital protegido
    [Tags]    informe    multimercadoscapitalprotegido    inicial
    Login.Acessar o HUB    ${EMAIL}
    Profile.Alterar o perfil    Administrador    CAIXA    1
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro PLCota inicial para limites
    ...    DIA=${dataInicial.DIA}    MES=${MES}    ANO=${ANO}    
    ...    COD_SCLASSE=C0000290386    
    ...    COTA=    
    ...    PATRIMONIO=    
    ...    COTISTA=
    Validar-Processamento.Validar processamento do informe inicial

[PL/Cota] Envio de informe validando o limite superior externo da rentabilidade do tipo multimercados capital protegido
    [Tags]    informe    multimercadoscapitalprotegido    superiorexterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Superior Externo
    ...    DIA=${superiorExterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=3.66
    ...    COD_SCLASSE=C000029038
    Validar-Processamento.Validar processamento do informe de rentabilidade    Rejeitado

[PL/Cota] Envio de informe validando o limite superior interno da rentabilidade do tipo multimercados capital protegido
    [Tags]    informe    multimercadoscapitalprotegido    superiorinterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Superior Interno
    ...    DIA=${superiorInterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=3.64
    ...    COD_SCLASSE=C0000290386
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior interno da rentabilidade do tipo multimercados capital protegido
    [Tags]    informe    multimercadoscapitalprotegido    inferiorinterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Inferior Interno
    ...    DIA=${inferiorInterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=-3.66
    ...    COD_SCLASSE=C0000290386
    Validar-Processamento.Validar processamento do informe de rentabilidade    Rejeitado

[PL/Cota] Envio de informe validando o limite inferior externo da rentabilidade do tipo multimercados capital protegido
    [Tags]    informe    multimercadoscapitalprotegido    inferiorexterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Inferior Externo
    ...    DIA=${inferiorExterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=-3.64
    ...    COD_SCLASSE=C0000290386
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite médio da rentabilidade do tipo multimercados capital protegido
    [Tags]    informe    multimercadoscapitalprotegido    medio
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Limite Medio
    ...    DIA=${limiteMedio.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=1
    ...    COD_SCLASSE=C0000290386
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado
