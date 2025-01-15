*** Settings ***
Documentation      Essa automação valida Preenchimento razão social ok, nome comercial ok (LONGO PRAZO/Sufixo)

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test084] Validar Preenchimento razão social ok, nome comercial ok (LONGO PRAZO/Sufixo)
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIF    FIF    Monoclasse    
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe de Multimercados    Teste CRED PRIV LP IE FC    Teste CRED PRIV LP IE FC
    Preencher perfil da classe com argumentos Registro Multimercado V13    Multimercado    Multimercado    Multimercados Balanceados    ALOCACAO    BALANCEADOS
    Preencher taxas da classe Registros V13
    Preencher os prestadores da classe
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse V13
    Preencher perfil da subclasse codigo CVM/B3 Cambial V13
    Preencher taxas Subclasse V13
    Preencher valor minimo e movimentacao
    Cadastrar prestadores da subclasse
    Validar tela detalhes do fundo
    Validar preenchimento nomeComercial longo prazo