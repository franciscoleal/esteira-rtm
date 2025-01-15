*** Settings ***
Documentation    Essa automação cadastra um informe com competência igual ultimo dia do mês

Resource            ../../../../../main.robot

Test Setup          Navegador-Config.Abrir o navegador
Test Teardown       Navegador-Config.Fechar o navegador

*** Test Cases ***
[PL COTA - Validação 1º Nível - Regra Dia Útil][Test11] Informe com competência igual ultimo dia do mês
    Login.Acessar o HUB    USER=${EMAIL}    ENV=${LINK_HUB_UAT}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Igual-Ultimo-Dia-Mes.Preencher cadastro PLCota com competencia igual ultimo dia do mes
    ...    DIA=30    MES=09    ANO=2024
    ...    SUBCLASSE=S0001193864
    ...    VALORCOTA=1000
    ...    PATRIMONIOLIQUIDO=100000
    ...    TOTALAPLICACOES=5000
    ...    TOTALRESGATES=100
    ...    TOTALRESGATESIR=0
    ...    NUMEROCOTISTAS=5
    Validar-Processamento-Informe.Validar processamento do informe    Processado