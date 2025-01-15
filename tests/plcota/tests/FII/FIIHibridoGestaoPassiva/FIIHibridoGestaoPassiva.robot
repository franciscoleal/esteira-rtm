*** Settings ***
Documentation       Essa automação valida a variação de rentabilidade do tipo anbima: FII hibrido gestão passiva

Resource            ../../../../main.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL/Cota] Envio de informe inicial do tipo FII hibrido gestão passiva
    [Tags]    informe    fiihibridogestaopassiva    inicial
    Acessar o HUB    ${EMAIL}
    Profile.Alterar o perfil    Administrador    BTG PACTUAL SERVICOS FINANCEIROS SA DTVM    4
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota inicial para limites    COD_SCLASSE=S0000362670    COTA=    PATRIMONIO=    COTISTA=
    Validar processamento do informe inicial

[PL/Cota] Envio de informe validando o limite superior externo da rentabilidade do tipo FII hibrido gestão passiva
    [Tags]    informe    fiihibridogestaopassiva    superiorexterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    superior externo    3.74    S0000362670
    Validar processamento do informe de rentabilidade    Rejeitado

[PL/Cota] Envio de informe validando o limite superior interno da rentabilidade do tipo FII hibrido gestão passiva
    [Tags]    informe    fiihibridogestaopassiva    superiorinterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    superior interno    3.72    S0000362670
    Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior externo da rentabilidade do tipo FII hibrido gestão passiva
    [Tags]    informe    fiihibridogestaopassiva    inferiorexterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    inferior externo    -3.72    S0000362670
    Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior interno da rentabilidade do tipo FII hibrido gestão passiva
    [Tags]    informe    fiihibridogestaopassiva    inferiorinterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    inferior interno    -3.74    S0000362670
    Validar processamento do informe de rentabilidade    Rejeitado

[PL/Cota] Envio de informe validando o limite médio da rentabilidade do tipo FII hibrido gestão passiva
    [Tags]    informe    fiihibridogestaopassiva    medio
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    limite medio    1    S0000362670
    Validar processamento do informe de rentabilidade    Processado
