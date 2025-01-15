*** Settings ***
Documentation       Essa automação valida a variação de rentabilidade do tipo anbima: ações sustentabilidade/governança

Resource            ../../../../../../main.robot

Test Setup          Navegador-Config.Abrir o navegador
Test Teardown       Navegador-Config.Fechar o navegador


*** Test Cases ***
[PL/Cota] Envio de informe inicial do tipo ações sustentabilidade/governança
    [Tags]    informe    acoessustentabilidadegovernança    inicial
    Login.Acessar o HUB    ${EMAIL}
    Profile.Alterar o perfil    Administrador    ITAU    1
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro PLCota inicial para limites    
    ...    DIA=${dataInicial.DIA}    MES=${MES}    ANO=${ANO}
    ...    COD_SCLASSE=C0000202983    
    ...    COTA=1000    
    ...    PATRIMONIO=100000
    Validar-Processamento.Validar processamento do informe inicial

[PL/Cota] Envio de informe validando o limite superior externo da rentabilidade do tipo ações sustentabilidade/governança
    [Tags]    informe    acoessustentabilidadegovernança    superiorexterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Superior Externo
    ...    DIA=${superiorExterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=3.5
    ...    COD_SCLASSE=C0000202983
    Validar-Processamento.Validar processamento do informe de rentabilidade    Possiveis Inconsistencias

[PL/Cota] Envio de informe validando o limite superior interno da rentabilidade do tipo ações sustentabilidade/governança
    [Tags]    informe    acoessustentabilidadegovernança    superiorinterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Superior Interno
    ...    DIA=${superiorInterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=3.48
    ...    COD_SCLASSE=C0000202983
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior interno da rentabilidade do tipo ações sustentabilidade/governança
    [Tags]    informe    acoessustentabilidadegovernança    inferiorinterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Inferior Interno
    ...    DIA=${inferiorInterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=-3.5
    ...    COD_SCLASSE=C0000202983
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior externo da rentabilidade do tipo ações sustentabilidade/governança
    [Tags]    informe    acoessustentabilidadegovernança    inferiorexterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Inferior Externo
    ...    DIA=${inferiorExterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=-3.48
    ...    COD_SCLASSE=C0000202983
    Validar-Processamento.Validar processamento do informe de rentabilidade    Possiveis Inconsistencias

[PL/Cota] Envio de informe validando o limite médio da rentabilidade do tipo ações sustentabilidade/governança
    [Tags]    informe    acoessustentabilidadegovernança    medio
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Limite medio
    ...    DIA=${limiteMedio.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=1
    ...    COD_SCLASSE=C0000202983
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado
