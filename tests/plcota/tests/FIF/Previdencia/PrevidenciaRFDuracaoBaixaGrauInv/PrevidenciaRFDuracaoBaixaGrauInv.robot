*** Settings ***
Documentation       Essa automação valida a variação de rentabilidade do tipo anbima: previdencia RF duração baixa grau inv

Resource            ../../../../../main.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador

# Inconsistências identificadas - Rentabilidade não encontrada para a classe informada
# Inconsistências identificadas - Origem do fundo é Galgo e o Informe foi enviado via tela, api ou arquivo.
#  Inconsistências identificadas - Rentabilidade não encontrada para a classe informada
*** Test Cases ***
[PL/Cota] Envio de informe inicial do tipo previdencia RF duração baixa grau inv
    [Tags]    informe    previdenciarfduracaobaixagrauinv    inicial
    Acessar o HUB    ${EMAIL}
    Profile.Alterar o perfil    Administrador    BEM DTVM    5
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota inicial para limites    COD_SCLASSE=C0000114715    COTA=    PATRIMONIO=    COTISTA=
    Validar processamento do informe inicial

[PL/Cota] Envio de informe validando o limite superior externo da rentabilidade do tipo previdencia RF duração baixa grau inv
    [Tags]    informe    previdenciarfduracaobaixagrauinv    superiorexterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    superior externo    3.29    C0000114715
    Validar processamento do informe de rentabilidade    Rejeitado

[PL/Cota] Envio de informe validando o limite superior interno da rentabilidade do tipo previdencia RF duração baixa grau inv
    [Tags]    informe    previdenciarfduracaobaixagrauinv    superiorinterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    superior interno    3.27    C0000114715
    Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior externo da rentabilidade do tipo previdencia RF duração baixa grau inv
    [Tags]    informe    previdenciarfduracaobaixagrauinv    inferiorexterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    inferior externo    -3.27    C0000114715
    Validar processamento do informe de rentabilidade    Processado

[PL/Cota] Envio de informe validando o limite inferior interno da rentabilidade do tipo previdencia RF duração baixa grau inv
    [Tags]    informe    previdenciarfduracaobaixagrauinv    inferiorinterno
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    inferior interno    -3.29    C0000114715
    Validar processamento do informe de rentabilidade    Rejeitado

[PL/Cota] Envio de informe validando o limite médio da rentabilidade do tipo previdencia RF duração baixa grau inv
    [Tags]    informe    previdenciarfduracaobaixagrauinv    medio
    Acessar o HUB    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro limites PLCota    limite medio    1    C0000114715
    Validar processamento do informe de rentabilidade    Processado
