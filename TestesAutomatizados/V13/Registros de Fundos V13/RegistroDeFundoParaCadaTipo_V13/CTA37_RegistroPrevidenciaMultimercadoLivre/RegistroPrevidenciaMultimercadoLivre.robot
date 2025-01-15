*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo Previdencia Multimercados Livre

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de Fundo]Registrar fundo do tipo Previdencia Multimercados Livre
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIF Previdencia Multimercado Livre    FIF    Monoclasse
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe previdencia multimercado    teste, CRED PRIV, Prev, LP, IE FIC FC        teste, CRED PRIV, Prev, LP, IE FIC FC 
    Preencher perfil da classe com argumentos previdencia multimercado Livre V13    Multimercado    Previdência    Previdência Multimercado Livre    Multimercados    Livre
    Alterar o preenchimento das taxas da classe para subclasse
    Preencher os prestadores da classe
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse V13
    Preencher perfil da subclasse codigo CVM/B3 Cambial V13
    Preencher taxas da classe RF Previdencia V13
    Preencher valor minimo e movimentacao
    Cadastrar prestadores da subclasse
    Validar tela detalhes do fundo
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Validar fundo em analise    PrevidenciaMultimercadosLivre
