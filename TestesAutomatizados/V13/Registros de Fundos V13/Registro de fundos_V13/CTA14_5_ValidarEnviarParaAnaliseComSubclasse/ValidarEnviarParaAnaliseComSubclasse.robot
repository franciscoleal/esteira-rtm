*** Settings ***
Documentation      Essa automação valida botão "Enviar para analise da Anbima"

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de fundos][Test14]Validar botão "Enviar para analise da Anbima"
    [Tags]    test01    test14
    Acessar o HUB    ${EMAIL}
    Selecionar acesso    Administrador
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIF Ações Indexados    FIF    Monoclasse
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe    Teste Mercado de Acesso IE
    Preencher perfil da classe com argumentos completo V13   Ações    Ações   Ações Livres    ATIVOS    LIVRE
    Preencher taxas da classe Registros V13
    Preencher os prestadores da classe FIF/FIDC       
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse V13
    Preencher perfil da subclasse FIF V13
    #Preencher taxas da subclasse V13    #depois de ajustar o bug, deletar a linha de baixo , e habilitar essa
    Preencher as taxas de consultoria especializada subclasse V13
    Preencher valor minimo e movimentacao
    Cadastrar prestadores da subclasse
    Finalizar registro
