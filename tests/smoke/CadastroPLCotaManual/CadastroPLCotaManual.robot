*** Settings ***
Documentation       Essa automação cadastra uma PL/Cota Manualmente

Resource            
Resource            ../../../main.robot

Test Setup          Navegador-config.Abrir o navegador
Test Teardown       Navegador-config.Fechar o navegador


*** Test Cases ***
[PL/Cota] Cadastrar uma PL/Cota Manualmente
    [Tags]    cadplcota
    Login.Acessar o HUB    ${EMAIL}    ${LINK_HUB_UAT}
    Profile.Alterar o perfil    
    ...    Perfil=Administrador    
    ...    Instituicao=ITAU        
    ...    menu=1
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro PLCota inicial para limites
    ...    DIA=30    MES=08    ANO=2024        
    ...    COD_SCLASSE=C0000649708
    ...    COTA=1,68942900000000000
    ...    PATRIMONIO=13717349,97000
    ...    COTISTA=1
    Validar-Processamento.Validar processamento do informe inicial

[PL/Cota] Cadastrar uma PL/Cota Manualmente com informações do mês anterior
    [Tags]    cadplcota
    Login.Acessar o HUB    ${EMAIL}    ${LINK_HUB_UAT}
    Profile.Alterar o perfil    
    ...    Perfil=Administrador    
    ...    Instituicao=ITAU 
    ...    menu=1
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro PLCota inicial para limites
    ...    DIA=30    MES=09    ANO=2024        
    ...    COD_SCLASSE=C0000649708    # fundo mensal
    ...    COTA=1,68942900000000000
    ...    PATRIMONIO=13717349,97000
    ...    COTISTA=1
    Validar-Processamento.Validar processamento do informe igual ao mês anterior


# C0000059986 - galgo - abertura - ITAU UNIBANCO SA
# C0000059951 - hub - abertura - ITAU UNIBANCO SA