*** Settings ***
Documentation       Essa automação valida a variação de rentabilidade do tipo anbima multimercado livre    no ambiente de mercado

Resource            ../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL/Cota] Envio de informe inicial do tipo multimercado livre
    [Tags]    informe    multimercadolivre    inicial
    Acessar o HUB de mercado    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota inicial para limites    C0000463280
    Validar processamento do informe inicial

[PL/Cota] Envio de informe validando o limite superior externo da rentabilidade do tipo multimercado livre
    [Tags]    informe    multimercadolivre    superiorexterno
    Acessar o HUB de mercado    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    superior externo    3.09    C0000463280
    Validar processamento do informe de rentabilidade    Rejeitado

[PL/Cota] Envio de informe validando o limite superior interno da rentabilidade do tipo multimercado livre
    [Tags]    informe    multimercadolivre    superiorinterno
    Acessar o HUB de mercado    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    superior interno    3.07    C0000463280
    Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior externo da rentabilidade do tipo multimercado livre
    [Tags]    informe    multimercadolivre    inferiorexterno
    Acessar o HUB de mercado    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    inferior externo    -3.07    C0000463280
    Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior interno da rentabilidade do tipo multimercado livre
    [Tags]    informe    multimercadolivre    inferiorinterno
    Acessar o HUB de mercado    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    inferior interno    -3.09    C0000463280
    Validar processamento do informe de rentabilidade    Rejeitado

[PL/Cota] Envio de informe validando o limite médio da rentabilidade do tipo multimercado livre
    [Tags]    informe    multimercadolivre    medio
    Acessar o HUB de mercado    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    limite medio    1    C0000463280
    Validar processamento do informe de rentabilidade    Processado
