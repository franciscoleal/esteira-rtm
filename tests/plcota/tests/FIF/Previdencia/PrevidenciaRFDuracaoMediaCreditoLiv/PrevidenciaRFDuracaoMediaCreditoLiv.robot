*** Settings ***
Documentation       Essa automação valida a variação de rentabilidade do tipo anbima: previdência RF duração média crédito liv

Resource            ../../../../../main.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL/Cota] Envio de informe inicial do tipo previdência RF duração média crédito liv
    [Tags]    informe    previdenciarfduracaomediacreditoliv    inicial
    Acessar o HUB    ${EMAIL}
    Profile.Alterar o perfil    Administrador    BEM DTVM    5
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota inicial para limites    COD_SCLASSE=C0000217451    COTA=    PATRIMONIO=    COTISTA=
    Validar processamento do informe inicial

[PL/Cota] Envio de informe validando o limite superior externo da rentabilidade do tipo previdência RF duração média crédito liv
    [Tags]    informe    previdenciarfduracaomediacreditoliv    superiorexterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    superior externo    3.56    C0000217451
    Validar processamento do informe de rentabilidade    Rejeitado

[PL/Cota] Envio de informe validando o limite superior interno da rentabilidade do tipo previdência RF duração média crédito liv
    [Tags]    informe    previdenciarfduracaomediacreditoliv    superiorinterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    superior interno    3.54    C0000217451
    Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior externo da rentabilidade do tipo previdência RF duração média crédito liv
    [Tags]    informe    previdenciarfduracaomediacreditoliv    inferiorexterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    inferior externo    -3.54    C0000217451
    Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior interno da rentabilidade do tipo previdência RF duração média crédito liv
    [Tags]    informe    previdenciarfduracaomediacreditoliv    inferiorinterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    inferior interno    -3.56    C0000217451
    Validar processamento do informe de rentabilidade    Rejeitado

[PL/Cota] Envio de informe validando o limite médio da rentabilidade do tipo previdência RF duração média crédito liv
    [Tags]    informe    previdenciarfduracaomediacreditoliv    medio
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    limite medio    1    C0000217451
    Validar processamento do informe de rentabilidade    Processado
