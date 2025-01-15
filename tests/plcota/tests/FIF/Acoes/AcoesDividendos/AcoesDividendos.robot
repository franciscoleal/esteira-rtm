*** Settings ***
Documentation       Essa automação valida a variação de rentabilidade do tipo anbima: ações dividendos
        ...         Este cenário irá enviar os valores iniciais para cota e patrimonio
        ...         cota=1000  patrimonio=100.000
        ...         a formula para calculo da rentabilidade é:
        ...         COTA = cota+((cota*percent)/100) -> 1000,00 + (1000,00 * 3.19)    / 100 
        ...         PATRIMONIO = patrimonio+cota
        ...         a rentabilidade aplica neste teste é de: 3.18
        ...         Para este cenário serão aplicadas as variações de Superior Externo/Interno e Inferior Interno/Externo
        ...         Para os Externos o informe deverá ser rejeitado
        ...         Para os Internos o informe deverá ser processado


Resource    ../../../../../../main.robot

Test Setup          Navegador-config.Abrir o navegador
Test Teardown       Navegador-config.Fechar o navegador

*** Test Cases ***
[PL/Cota] Envio de informe inicial do tipo ações dividendos
    [Documentation]    
    [Tags]    informe    acoesdividendos    inicial
    Login.Acessar o HUB    ${EMAIL}
    Profile.Alterar o perfil    Administrador    ITAU    1
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro PLCota inicial para limites    
    ...    DIA=${dataInicial.DIA}    MES=${MES}    ANO=${ANO}
    ...    COD_SCLASSE=C0000061395    
    ...    COTA=    
    ...    PATRIMONIO=    
    ...    COTISTA=                
    Validar-Processamento.Validar processamento do informe inicial

[PL/Cota] Envio de informe validando o limite superior externo da rentabilidade do tipo ações dividendos
    [Tags]    informe    acoesdividendos    superiorexterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Superior Externo
    ...    DIA=${superiorExterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=3.19
    ...    COD_SCLASSE=C0000061395
    Validar-Processamento.Validar processamento do informe de rentabilidade    Possiveis Inconsistencias

[PL/Cota] Envio de informe validando o limite superior interno da rentabilidade do tipo ações dividendos
    [Tags]    informe    acoesdividendos    superiorinterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Superior Interno
    ...    DIA=${superiorInterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=3.17    
    ...    COD_SCLASSE=C0000061395
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior interno da rentabilidade do tipo ações dividendos
    [Tags]    informe    acoesdividendos    inferiorinterno
    Login.Acessar o HUB    ${EMAIL}
    Profile.Alterar o perfil    Autorregulador    ANBIMA    1
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Inferior Internos
    ...    DIA=${inferiorInterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=-3.19
    ...    COD_SCLASSE=C0000061395
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior externo da rentabilidade do tipo ações dividendos
    [Tags]    informe    acoesdividendos    inferiorexterno
    Login.Acessar o HUB    ${EMAIL}
    Profile.Alterar o perfil    Autorregulador    ANBIMA    1
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Inferior Externo
    ...    DIA=${inferiorExterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=-3.17
    ...    COD_SCLASSE=C0000061395
    Validar-Processamento.Validar processamento do informe de rentabilidade    Possiveis Inconsistencias

[PL/Cota] Envio de informe validando o limite médio da rentabilidade do tipo ações dividendos
    [Tags]    informe    acoesdividendos    medio
    Login.Acessar o HUB    ${EMAIL}
    Profile.Alterar o perfil    Autorregulador    ANBIMA    1
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Limite medio
    ...    DIA=${limiteMedio.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=
    ...    COD_SCLASSE=C0000061395
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado
