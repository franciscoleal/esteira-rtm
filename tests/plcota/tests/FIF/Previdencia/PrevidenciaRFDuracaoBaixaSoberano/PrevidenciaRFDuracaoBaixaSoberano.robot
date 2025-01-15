*** Settings ***
Documentation       Essa automação valida a variação de rentabilidade do tipo anbima: previdência RF duração baixa soberano

Resource            ../../../../../main.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador

# Inconsistências identificadas - Rentabilidade não encontrada para a classe informada

*** Test Cases ***
[PL/Cota] Envio de informe inicial do tipo previdência RF duração baixa soberano
    [Tags]    informe    previdenciarfduracaobaixasoberano    inicial
    Acessar o HUB    ${EMAIL}
    Profile.Alterar o perfil    Administrador    BB ASSET MANAGEMENT    9
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota inicial para limites    COD_SCLASSE=C0000150339    COTA=    PATRIMONIO=    COTISTA=
    Validar processamento do informe inicial

[PL/Cota] Envio de informe validando o limite superior externo da rentabilidade do tipo previdência RF duração baixa soberano
    [Tags]    informe    previdenciarfduracaobaixasoberano    superiorexterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    superior externo    3.2    C0000150339
    Validar processamento do informe de rentabilidade    Rejeitado

[PL/Cota] Envio de informe validando o limite superior interno da rentabilidade do tipo previdência RF duração baixa soberano
    [Tags]    informe    previdenciarfduracaobaixasoberano    superiorinterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    superior interno    3.18    C0000150339
    Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior externo da rentabilidade do tipo previdência RF duração baixa soberano
    [Tags]    informe    previdenciarfduracaobaixasoberano    inferiorexterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    inferior externo    -3.18    C0000150339
    Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior interno da rentabilidade do tipo previdência RF duração baixa soberano
    [Tags]    informe    previdenciarfduracaobaixasoberano    inferiorinterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    inferior interno    -3.2    C0000150339
    Validar processamento do informe de rentabilidade    Rejeitado

[PL/Cota] Envio de informe validando o limite médio da rentabilidade do tipo previdência RF duração baixa soberano
    [Tags]    informe    previdenciarfduracaobaixasoberano    medio
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    limite medio    1    C0000150339
    Validar processamento do informe de rentabilidade    Processado
