*** Settings ***
Documentation       Essa automação valida a variação de rentabilidade do tipo anbima: FII desenv. para renda gestão passiva

Resource            ../../../../main.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL/Cota] Envio de informe inicial do tipo FII desenv. para renda gestão passiva
    [Tags]    informe    fiidesenvpararendagestaopassiva    inicial
    Acessar o HUB    ${EMAIL}
    Profile.Alterar o perfil    Administrador    BEM DTVM    5
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota inicial para limites    COD_SCLASSE=S0000362530    COTA=    PATRIMONIO=    COTISTA=
    Validar processamento do informe inicial

[PL/Cota] Envio de informe validando o limite superior externo da rentabilidade do tipo FII desenv. para renda gestão passiva
    [Tags]    informe    fiidesenvpararendagestaopassiva    superiorexterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    superior externo    3.83    S0000362530
    Validar processamento do informe de rentabilidade    Rejeitado

[PL/Cota] Envio de informe validando o limite superior interno da rentabilidade do tipo FII desenv. para renda gestão passiva
    [Tags]    informe    fiidesenvpararendagestaopassiva    superiorinterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    superior interno    3.81    S0000362530
    Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior externo da rentabilidade do tipo FII desenv. para renda gestão passiva
    [Tags]    informe    fiidesenvpararendagestaopassiva    inferiorexterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    inferior externo    -3.81    S0000362530
    Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior interno da rentabilidade do tipo FII desenv. para renda gestão passiva
    [Tags]    informe    fiidesenvpararendagestaopassiva    inferiorinterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    inferior interno    -3.83    S0000362530
    Validar processamento do informe de rentabilidade    Rejeitado

[PL/Cota] Envio de informe validando o limite médio da rentabilidade do tipo FII desenv. para renda gestão passiva
    [Tags]    informe    fiidesenvpararendagestaopassiva    medio
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    limite medio    1    S0000362530
    Validar processamento do informe de rentabilidade    Processado
