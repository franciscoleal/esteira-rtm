*** Settings ***
Documentation       Essa automação cadastra uma PL/Cota Manualmente

Resource            ../../Keywords/Keywords.robot
Resource            ../../../main.robot

Test Setup          Navegador-config.Abrir o navegador
Test Teardown       Navegador-config.Fechar o navegador


*** Test Cases ***
[PL/Cota] Cadastrar uma PL/Cota Manualmente
    [Tags]    cadplcota
    Login.Acessar o HUB    ${EMAIL}
    Profile.Alterar o perfil    
    ...    Perfil=Administrador    
    ...    Instituicao=ITAU UNIBANCO SA    
    ...    menu=1
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro PLCota inicial para limites
    ...    DIA=01    MES=08    ANO=2024        
    ...    COD_SCLASSE=C0000059986    
    ...    COTA=1485,227732 
    ...    PATRIMONIO=8353980,22
    ...    COTISTA=60
    Validar-Processamento.Validar processamento do informe inicial


# C0000059986 - galgo - abertura - ITAU UNIBANCO SA
# C0000059951 - hub - abertura - ITAU UNIBANCO SA