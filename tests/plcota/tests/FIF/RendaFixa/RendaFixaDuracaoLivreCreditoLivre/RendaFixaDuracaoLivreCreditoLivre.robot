*** Settings ***
Documentation       Essa automação valida a variação de rentabilidade do tipo anbima: renda fixa duração livre credito livre

Resource            ../../../../../main.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL/Cota] Envio de informe inicial do tipo renda fixa duração livre credito livre
    [Tags]    informe    rendafixaduracaolivrecreditolivre    inicial
    Acessar o HUB    ${EMAIL}
    Profile.Alterar o perfil    Administrador    ITAU UNIBANCO SA    3
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota inicial para limites    COD_SCLASSE=C0000127981    COTA=    PATRIMONIO=    COTISTA=
    Validar processamento do informe inicial

[PL/Cota] Envio de informe validando o limite superior externo da rentabilidade do tipo renda fixa duração livre credito livre
    [Tags]    informe    rendafixaduracaolivrecreditolivre    superiorexterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    superior externo    3.16    C0000127981
    Validar processamento do informe de rentabilidade    Rejeitado

[PL/Cota] Envio de informe validando o limite superior interno da rentabilidade do tipo renda fixa duração livre credito livre
    [Tags]    informe    rendafixaduracaolivrecreditolivre    superiorinterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    superior interno    3.14    C0000127981
    Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior externo da rentabilidade do tipo renda fixa duração livre credito livre
    [Tags]    informe    rendafixaduracaolivrecreditolivre    inferiorexterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    inferior externo    -3.14    C0000127981
    Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior interno da rentabilidade do tipo renda fixa duração livre credito livre
    [Tags]    informe    rendafixaduracaolivrecreditolivre    inferiorinterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    inferior interno    -3.16    C0000127981
    Validar processamento do informe de rentabilidade    Rejeitado

[PL/Cota] Envio de informe validando o limite médio da rentabilidade do tipo renda fixa duração livre credito livre
    [Tags]    informe    rendafixaduracaolivrecreditolivre    medio
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    limite medio    1    C0000127981
    Validar processamento do informe de rentabilidade    Processado
