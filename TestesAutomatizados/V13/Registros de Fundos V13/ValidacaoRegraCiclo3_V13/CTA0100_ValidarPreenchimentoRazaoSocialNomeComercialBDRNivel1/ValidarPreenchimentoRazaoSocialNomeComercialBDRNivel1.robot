*** Settings ***
Documentation      Essa automação valida Preenchimento razão social ok, nome comercial ok (BDR NÍVEL 1/Sufixo)

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Test0100] Validar Preenchimento razão social ok, nome comercial ok (BDR NÍVEL 1/Sufixo)
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    Monoclasse    FIF Ações Investimento no Exterior    FIF
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe    Teste BDR Nível 1 Mercado de Acesso IE
    Preencher perfil da classe com argumentos no exterior V13    Ações    Ações    Ações Investimento no Exterior    Investimento_Exterior    Investimento_Exterior
    Preencher taxas da classe Registros V13 
    Preencher os prestadores da classe
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse V13
    Preencher perfil da subclasse codigo CVM/B3 acoes V13
    Preencher taxas Subclasse V13
    Preencher valor minimo e movimentacao
    Cadastrar prestadores da subclasse
    Validar tela detalhes do fundo
    Validar preenchimento razaoSocial e nomeComercial BDR Nível 1