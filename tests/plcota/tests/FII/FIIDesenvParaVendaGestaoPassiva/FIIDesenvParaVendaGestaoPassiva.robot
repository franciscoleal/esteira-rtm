*** Settings ***
Documentation       Essa automação valida a variação de rentabilidade do tipo anbima: FII desenv. para venda gestão passiva

Resource            ../../../../main.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL/Cota] Envio de informe inicial do tipo FII desenv. para venda gestão passiva
    [Tags]    informe    fiidesenvparavendagestaopassiva    inicial
    Acessar o HUB    ${EMAIL}
    Profile.Alterar o perfil    Administrador    BRL DTVM    6 
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota inicial para limites    COD_SCLASSE=S0000484075    COTA=    PATRIMONIO=    COTISTA=
    Validar processamento do informe inicial

[PL/Cota] Envio de informe validando o limite superior externo da rentabilidade do tipo FII desenv. para venda gestão passiva
    [Tags]    informe    fiidesenvparavendagestaopassiva    superiorexterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    superior externo    3.57    S0000484075
    Validar processamento do informe de rentabilidade    Rejeitado

[PL/Cota] Envio de informe validando o limite superior interno da rentabilidade do tipo FII desenv. para venda gestão passiva
    [Tags]    informe    fiidesenvparavendagestaopassiva    superiorinterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    superior interno    3.55    S0000484075
    Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior externo da rentabilidade do tipo FII desenv. para venda gestão passiva
    [Tags]    informe    fiidesenvparavendagestaopassiva    inferiorexterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    inferior externo    -3.55    S0000484075
    Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior interno da rentabilidade do tipo FII desenv. para venda gestão passiva
    [Tags]    informe    fiidesenvparavendagestaopassiva    inferiorinterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    inferior interno    -3.57    S0000484075
    Validar processamento do informe de rentabilidade    Rejeitado

[PL/Cota] Envio de informe validando o limite médio da rentabilidade do tipo FII desenv. para venda gestão passiva
    [Tags]    informe    fiidesenvparavendagestaopassiva    medio
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    limite medio    1    S0000484075
    Validar processamento do informe de rentabilidade    Processado
