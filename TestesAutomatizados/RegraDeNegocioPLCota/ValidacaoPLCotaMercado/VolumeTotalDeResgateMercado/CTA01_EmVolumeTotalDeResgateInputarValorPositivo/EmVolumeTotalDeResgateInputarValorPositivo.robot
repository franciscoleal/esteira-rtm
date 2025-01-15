*** Settings ***
Documentation       Essa automação cadastra um informe em volume total de resgate com valor positivo

Resource            ../../../../../Keywords/Keywords.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
[PL/Cota] Em volume total de resgate inputar valor positivo
    [Tags]    cadplcota
    Acessar o HUB de mercado    ${EMAIL}
    Acessar o PLCota
    Iniciar cadastro manual
    Preencher cadastro PLCota    C0000519162    # 17/01/2024/10
    Validar processamento do informe    Processado
