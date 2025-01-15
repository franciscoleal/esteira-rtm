*** Settings ***
Documentation      Essa automação valida Preenchimento razão social ok, nome comercial ok (REFERENCIADO/Sufixo)

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Test095] Validar Preenchimento razão social ok, nome comercial ok (REFERENCIADO/Sufixo)
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIF    FIF    Monoclasse
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe de renda fixa    teste CRED PRIV REFERENCIADO FC IE    teste CRED PRIV REFERENCIADO FC IE
    Preencher perfil da classe com argumentos RF V13    Renda fixa    Renda Fixa    Renda Fixa Duração Alta Soberano    Duracao_Alta    Soberano 
    Preencher taxas da classe Renda Fixa V13
    Preencher os prestadores da classe
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse V13
    Preencher perfil da subclasse codigo CVM/B3 ETF V13
    Preencher taxas Subclasse V13
    Preencher valor minimo e movimentacao
    Cadastrar prestadores da subclasse
    Validar tela detalhes do fundo
    Validar preenchimento nomeComercial Referenciado