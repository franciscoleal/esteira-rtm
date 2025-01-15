*** Settings ***
Documentation       Essa automação valida a variação de rentabilidade do tipo anbima: renda fixa duração alta soberano

Resource            ../../../../../main.robot
Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL/Cota] Envio de informe inicial do tipo renda fixa duração alta soberano
    [Tags]    informe    rendafixaduracaoaltasoberano    inicial
    Acessar o HUB    ${EMAIL}
    Profile.Alterar o perfil    Administrador    ITAU UNIBANCO SA    3
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota inicial para limites    COD_SCLASSE=C0000108006    COTA=    PATRIMONIO=    COTISTA=
    Validar processamento do informe inicial

[PL/Cota] Envio de informe validando o limite superior externo da rentabilidade do tipo renda fixa duração alta soberano
    [Tags]    informe    rendafixaduracaoaltasoberano    superiorexterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    superior externo    3.4    C0000108006
    Validar processamento do informe de rentabilidade    Rejeitado

[PL/Cota] Envio de informe validando o limite superior interno da rentabilidade do tipo renda fixa duração alta soberano
    [Tags]    informe    rendafixaduracaoaltasoberano    superiorinterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    superior interno    3.38    C0000108006
    Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior externo da rentabilidade do tipo renda fixa duração alta soberano
    [Tags]    informe    rendafixaduracaoaltasoberano    inferiorexterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    inferior externo    -3.38    C0000108006
    Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior interno da rentabilidade do tipo renda fixa duração alta soberano
    [Tags]    informe    rendafixaduracaoaltasoberano    inferiorinterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    inferior interno    -3.4    C0000108006
    Validar processamento do informe de rentabilidade    Rejeitado

[PL/Cota] Envio de informe validando o limite médio da rentabilidade do tipo renda fixa duração alta soberano
    [Tags]    informe    rendafixaduracaoaltasoberano    medio
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    limite medio    1    C0000108006
    Validar processamento do informe de rentabilidade    Processado
