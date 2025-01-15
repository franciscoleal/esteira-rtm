*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo Fundos de FII com multiplas classes

Resource           ../../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de Fundo]Registrar fundo do tipo Fundo de FII com multiplas classes
    Acessar o HUB    vimerson.miura@vericode.com.br
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FII    FII
    Preencher perfil do fundo
    Preencher os prestadores FII
    Preencher os documentos
    Concluir o fundo casca
    Adicionar multiplas classes sem subclasse    2    FII
    Validar tela detalhes do fundo
    Validar classes criadas    2    FII
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Validar fundo em analise    FIITijoloDesenvolvimentoGestaoAtiva
