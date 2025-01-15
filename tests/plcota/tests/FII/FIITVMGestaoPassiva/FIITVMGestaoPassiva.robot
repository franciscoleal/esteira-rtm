*** Settings ***
Documentation       Essa automação valida a variação de rentabilidade do tipo anbima: FII TVM gestão passiva

Resource            ../../../../main.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL/Cota] Envio de informe inicial do tipo FII TVM gestão passiva
    [Tags]    informe    fiitvmgestaopassiva    inicial
    Acessar o HUB    ${EMAIL}
    Profile.Alterar o perfil    Administrador    BTG PACTUAL SERVICOS FINANCEIROS SA DTVM    4
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota inicial para limites    COD_SCLASSE=S0000719269    COTA=    PATRIMONIO=    COTISTA=
    Validar processamento do informe inicial

[PL/Cota] Envio de informe validando o limite superior externo da rentabilidade do tipo FII TVM gestão passiva
    [Tags]    informe    fiitvmgestaopassiva    superiorexterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    superior externo    3.8    S0000719269
    Validar processamento do informe de rentabilidade    Rejeitado

[PL/Cota] Envio de informe validando o limite superior interno da rentabilidade do tipo FII TVM gestão passiva
    [Tags]    informe    fiitvmgestaopassiva    superiorinterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    superior interno    3.78    S0000719269
    Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior externo da rentabilidade do tipo FII TVM gestão passiva
    [Tags]    informe    fiitvmgestaopassiva    inferiorexterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    inferior externo    -3.78    S0000719269
    Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior interno da rentabilidade do tipo FII TVM gestão passiva
    [Tags]    informe    fiitvmgestaopassiva    inferiorinterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    inferior interno    -3.8    S0000719269
    Validar processamento do informe de rentabilidade    Rejeitado

[PL/Cota] Envio de informe validando o limite médio da rentabilidade do tipo FII TVM gestão passiva
    [Tags]    informe    fiitvmgestaopassiva    medio
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    limite medio    1    S0000719269
    Validar processamento do informe de rentabilidade    Processado
