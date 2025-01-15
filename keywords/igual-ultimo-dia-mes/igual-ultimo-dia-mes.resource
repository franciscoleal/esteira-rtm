*** Settings ***
Resource    ../../main.robot

*** Variables ***


*** Keywords ***
Preencher cadastro PLCota com competencia igual ultimo dia do mes
    [Arguments]    ${SUBCLASSE}    ${VALORCOTA}    ${PATRIMONIOLIQUIDO}    ${TOTALAPLICACOES}    ${TOTALRESGATES}    ${TOTALRESGATESIR}    ${NUMEROCOTISTAS}    &{DATA}
    Commons.Wait And Input    //input[contains(@name,'codigoClasseSubclasse')]    ${SUBCLASSE}
    Commons.Set Specific Date    ${DATA.DIA}    ${DATA.MES}    ${DATA.ANO}
    Commons.Wait And Input    //input[contains(@name,'valorCota')]    ${VALORCOTA}
    Commons.Wait And Input    //input[contains(@name,'patrimonioLiquido')]    ${PATRIMONIOLIQUIDO}
    Commons.Wait And Input    //input[contains(@name,'volumeTotalAplicacoes')]    ${TOTALAPLICACOES}
    Commons.Wait And Input    //input[contains(@name,'volumeTotalResgates')]    ${TOTALRESGATES}
    Commons.Wait And Input    //input[contains(@name,'volumeTotalResgateIR')]    ${TOTALRESGATESIR}
    Commons.Wait And Input    //input[contains(@name,'numeroCotistas')]    ${NUMEROCOTISTAS}
    Commons.Wait And Click    //button[contains(.,'Submeter')]