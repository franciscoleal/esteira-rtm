*** Settings ***
Documentation       Essa automação valida a variação de rentabilidade do tipo anbima: previdencia RF duração alta credito liv

Resource            ../../../../../main.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL/Cota] Envio de informe inicial do tipo previdencia RF duração alta credito liv
    [Tags]    informe    previdenciarfduracaoaltacreditoliv    inicial
    Acessar o HUB    ${EMAIL}
    Profile.Alterar o perfil    Administrador    MERCANTIL DO BRASIL DTVM    8
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota inicial para limites    COD_SCLASSE=C0000083976    COTA=    PATRIMONIO=    COTISTA=
    Validar processamento do informe inicial

[PL/Cota] Envio de informe validando o limite superior externo da rentabilidade do tipo previdencia RF duração alta credito liv
    [Tags]    informe    previdenciarfduracaoaltacreditoliv    superiorexterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    superior externo    3.68    C0000083976
    Validar processamento do informe de rentabilidade    Rejeitado

[PL/Cota] Envio de informe validando o limite superior interno da rentabilidade do tipo previdencia RF duração alta credito liv
    [Tags]    informe    previdenciarfduracaoaltacreditoliv    superiorinterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    superior interno    3.66    C0000083976
    Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior externo da rentabilidade do tipo previdencia RF duração alta credito liv
    [Tags]    informe    previdenciarfduracaoaltacreditoliv    inferiorexterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    inferior externo    -3.66    C0000083976
    Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior interno da rentabilidade do tipo previdencia RF duração alta credito liv
    [Tags]    informe    previdenciarfduracaoaltacreditoliv    inferiorinterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    inferior interno    -3.68    C0000083976
    Validar processamento do informe de rentabilidade    Rejeitado

[PL/Cota] Envio de informe validando o limite médio da rentabilidade do tipo previdencia RF duração alta credito liv
    [Tags]    informe    previdenciarfduracaoaltacreditoliv    medio
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    limite medio    1    C0000083976
    Validar processamento do informe de rentabilidade    Processado
