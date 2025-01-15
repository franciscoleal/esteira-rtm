*** Settings ***
Resource    ../../main.robot

*** Variables ***


*** Keywords ***
Preencher cadastro completo de PLCota
    [Arguments]    ${COD_SCLASSE}=S0001231308    ${D}=1        #C0000015849
    [Documentation]    A variável D vem como padrão com 1 para setar o dia de hoje, escolha: +1 para um dia a mais, -1 para um dia a menos, ou Skip para setar o próximo dia útil sendo hoje uma sexta.
    Commons.Select Set Today    ${D}
    # Commons.Set Specific Date    07    08    2024
    Commons.Wait And Input    //input[contains(@name,'codigoClasseSubclasse')]    ${COD_SCLASSE}
    Commons.Wait And Input    //input[contains(@name,'valorCota')]    1200,00
    Commons.Wait And Input    //input[contains(@name,'patrimonioLiquido')]    12000,00
    Commons.Wait And Input    //input[contains(@name,'volumeTotalAplicacoes')]    0
    Commons.Wait And Input    //input[contains(@name,'volumeTotalResgates')]    0
    Commons.Wait And Input    //input[contains(@name,'volumeTotalResgateIR')]    0
    Commons.Wait And Input    //input[contains(@name,'numeroCotistas')]    1
    Commons.Wait And Click    //button[contains(.,'Submeter')]