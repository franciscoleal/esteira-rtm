*** Settings ***
Documentation       Essa automação valida a variação de rentabilidade do tipo anbima: ações indexados

Resource            ../../../../../../main.robot

Test Setup          Navegador-Config.Abrir o navegador
Test Teardown       Navegador-Config.Fechar o navegador


*** Test Cases ***
[PL/Cota] Envio de informe inicial do tipo ações indexados
    [Tags]    informe    acoesindexados    inicial
    Login.Acessar o HUB    ${EMAIL}
    Profile.Alterar o perfil    Administrador    ITAU    1
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro PLCota inicial para limites
    ...    DIA=${dataInicial.DIA}    MES=${MES}    ANO=${ANO}
    ...    COD_SCLASSE=C0000007420    COTA=    PATRIMONIO=    COTISTA=        
    Validar-Processamento.Validar processamento do informe inicial

[PL/Cota] Envio de informe validando o limite superior externo da rentabilidade do tipo ações indexados
    [Tags]    informe    acoesindexados    superiorexterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Superior Externo
    ...    DIA=${superiorExterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=3.02    
    ...    COD_SCLASSE=C0000007420
    Validar-Processamento.Validar processamento do informe de rentabilidade    Possiveis Inconsistencias

[PL/Cota] Envio de informe validando o limite superior interno da rentabilidade do tipo ações indexados
    [Tags]    informe    acoesindexados    superiorinterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Superior Interno
    ...    DIA=${superiorInterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=3
    ...    COD_SCLASSE=C0000007420
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior interno da rentabilidade do tipo ações indexados
    [Tags]    informe    acoesindexados    inferiorinterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Inferior Interno
    ...    DIA=${inferiorInterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=-3.02
    ...    COD_SCLASSE=C0000007420
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior externo da rentabilidade do tipo ações indexados
    [Tags]    informe    acoesindexados    inferiorexterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Inferior externo
    ...    DIA=${inferiorExterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=-3
    ...    COD_SCLASSE=C0000007420
    Validar-Processamento.Validar processamento do informe de rentabilidade    Possiveis Inconsistencias

[PL/Cota] Envio de informe validando o limite médio da rentabilidade do tipo ações indexados
    [Tags]    informe    acoesindexados    medio
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Limite Medio
    ...    DIA=${limiteMedio.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=
    ...    COD_SCLASSE=C0000007420
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado
