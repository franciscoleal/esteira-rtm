*** Settings ***
Documentation       Essa automação valida a variação de rentabilidade do tipo anbima: fundo de mono ações

Resource            ../../../../../../main.robot

Test Setup          Navegador-Config.Abrir o navegador
Test Teardown       Navegador-Config.Fechar o navegador


*** Test Cases ***
[PL/Cota] Envio de informe inicial do tipo fundo de mono ações
    [Tags]    informe    fundodemonoacoes    inicial
    Login.Acessar o HUB    ${EMAIL}
    Profile.Alterar o perfil    Administrador    ITAU    1
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro PLCota inicial para limites 
    ...    DIA=${dataInicial.DIA}    MES=${MES}    ANO=${ANO}   
    ...    COD_SCLASSE=C0000079014    
    ...    COTA=310,131306    
    ...    PATRIMONIO=14367512,89
    Validar-Processamento.Validar processamento do informe inicial

[PL/Cota] Envio de informe validando o limite superior externo da rentabilidade do tipo fundo de mono ações
    [Tags]    informe    fundodemonoacoes    superiorexterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Superior Externo
    ...    DIA=${superiorExterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=3.17
    ...    COD_SCLASSE=C0000079014
    Validar-Processamento.Validar processamento do informe de rentabilidade    Possiveis Inconsistencias

[PL/Cota] Envio de informe validando o limite superior interno da rentabilidade do tipo fundo de mono ações
    [Tags]    informe    fundodemonoacoes    superiorinterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Superior Interno
    ...    DIA=${superiorInterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=3.15
    ...    COD_SCLASSE=C0000079014
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior interno da rentabilidade do tipo fundo de mono ações
    [Tags]    informe    fundodemonoacoes    inferiorinterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Inferior Interno
    ...    DIA=${inferiorInterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=-3.15
    ...    COD_SCLASSE=C0000079014
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior externo da rentabilidade do tipo fundo de mono ações
    [Tags]    informe    fundodemonoacoes    inferiorexterno
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Inferior Externo
    ...    DIA=${inferiorExterno.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=-3.17
    ...    COD_SCLASSE=C0000079014
    Validar-Processamento.Validar processamento do informe de rentabilidade    Possiveis Inconsistencias


[PL/Cota] Envio de informe validando o limite médio da rentabilidade do tipo fundo de mono ações
    [Tags]    informe    fundodemonoacoes    medio
    Login.Acessar o HUB    ${EMAIL}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro limites PLCota Limite Medio
    ...    DIA=${limitemedio.DIA}    MES=${MES}    ANO=${ANO}
    ...    PERCENT=1
    ...    COD_SCLASSE=C0000079014
    Validar-Processamento.Validar processamento do informe de rentabilidade    Processado
