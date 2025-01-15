*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo Fundos de Multimercado com multiplas subclasses

Resource           ../../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de Fundo]Registrar fundo do tipo Fundos de Multimercado com multiplas subclasses
    Acessar o HUB    vimerson.miura@vericode.com.br
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIF Multimercado
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Adicionar multiplas subclasses no registro Multimercado    1    #Teste CRED PRIV LP IE FC    #Teste CRED PRIV LP IE FC        
    Validar tela detalhes do fundo
    Validar subclases criadas    1    #Multimercado
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Validar fundo em analise    Multimercado