*** Settings ***
Documentation       Essa automação valida a variação de rentabilidade do tipo anbima: previdência RF duração livre soberano

Resource            ../../../../../main.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


# Inconsistências identificadas Variação da cota fora do limite permitido. Variação encontrada: 3,1900%, limite mínimo de variacao: 5,0000%, limite máximo de variacao: 10,0000%

*** Test Cases ***
[PL/Cota] Envio de informe inicial do tipo previdência RF duração livre soberano
    [Tags]    informe    previdenciarfduracaolivresoberano    inicial
    Acessar o HUB    ${EMAIL}
    Profile.Alterar o perfil    Administrador    ITAU UNIBANCO SA    3
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota inicial para limites    COD_SCLASSE=C0000055700    COTA=    PATRIMONIO=    COTISTA=
    Validar processamento do informe inicial

[PL/Cota] Envio de informe validando o limite superior externo da rentabilidade do tipo previdência RF duração livre soberano
    [Tags]    informe    previdenciarfduracaolivresoberano    superiorexterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    superior externo    3.21    C0000055700
    Validar processamento do informe de rentabilidade    Rejeitado

[PL/Cota] Envio de informe validando o limite superior interno da rentabilidade do tipo previdência RF duração livre soberano
    [Tags]    informe    previdenciarfduracaolivresoberano    superiorinterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    superior interno    3.19    C0000055700
    Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior externo da rentabilidade do tipo previdência RF duração livre soberano
    [Tags]    informe    previdenciarfduracaolivresoberano    inferiorexterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    inferior externo    -3.19    C0000055700
    Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior interno da rentabilidade do tipo previdência RF duração livre soberano
    [Tags]    informe    previdenciarfduracaolivresoberano    inferiorinterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    inferior interno    -3.21    C0000055700
    Validar processamento do informe de rentabilidade    Rejeitado

[PL/Cota] Envio de informe validando o limite médio da rentabilidade do tipo previdência RF duração livre soberano
    [Tags]    informe    previdenciarfduracaolivresoberano    medio
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    limite medio    1    C0000055700
    Validar processamento do informe de rentabilidade    Processado
