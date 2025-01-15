*** Settings ***
Documentation    Essa automação cadastra um informe com competência diferente do último dia do mês

Resource            ../../../../../main.robot

Test Setup          Navegador-Config.Abrir o navegador
Test Teardown       Navegador-Config.Fechar o navegador

*** Test Cases ***

[PL COTA - Validação 1º Nível - Regra Dia Útil][Test10] Informe com competência diferente do ultimo dia do mês
    Login.Acessar o HUB    USER=${EMAIL}    ENV=${LINK_HUB_UAT}
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Diferente-Ultimo-Dia-Mes.Preencher cadastro PLCota com competencia diferente do ultimo dia do mes
    ...    DIA=16    MES=09    ANO=2024
    ...    SUBCLASSE=S0001193490
    ...    VALORCOTA=1000
    ...    PATRIMONIOLIQUIDO=100000
    ...    TOTALAPLICACOES=5000
    ...    TOTALRESGATES=100
    ...    TOTALRESGATESIR=20
    ...    NUMEROCOTISTAS=5
    Validar-Diferente-Ultimo-Dia-Mes.Validar exigencia de data diferente do ultimo dia do mes