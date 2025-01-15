*** Settings ***
Documentation      Essa automação valida Preenchimento razão social ok, nome comercial ok (REFERENCIADO/Sufixo)

Resource           ../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Test095] Validar Preenchimento razão social ok, nome comercial ok (REFERENCIADO/Sufixo)
    Acessar o HUB    vimerson.miura@vericode.com.br
    Selecionar acesso para Administrador    ITAU
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIF Renda Fixa
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe de renda fixa    teste REFERENCIADO FC IE    teste REFERENCIADO FC IE
    Preencher perfil da classe com argumentos referenciado    Renda fixa    Renda Fixa    Renda Fixa Duração Alta Soberano    Duracao_Alta    Soberano 
    Preencher as taxas da classe
    Preencher os prestadores da classe
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse
    Preencher perfil da subclasse
    Preencher as taxas de administracao da classe
    Preencher as taxas de gestao da classe
    Preencher as taxas de custodia da classe
    Preencher as taxas de distribuicao da classe
    Preencher as taxas de performance da subclasse
    Preencher as taxas de entrada e saida da subclasse
    Preencher as taxas de consultoria especializada
    Preencher valor minimo e movimentacao
    Cadastrar prestadores da subclasse
    Validar tela detalhes do fundo
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Validar fundo em analise    RFDuracaoAltaSoberano_Referenciado