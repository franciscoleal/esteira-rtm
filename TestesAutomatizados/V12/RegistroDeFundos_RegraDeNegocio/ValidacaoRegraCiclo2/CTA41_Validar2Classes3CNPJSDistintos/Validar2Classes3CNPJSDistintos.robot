*** Settings ***
Documentation      Essa automação valida registro do fundo com 2 classes com 3 CNPJ distintos (Acatar)

Resource           ../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test41] Validar registro do fundo com 2 classes com 3 CNPJ distintos (Acatar)
    Acessar o HUB    vimerson.miura@vericode.com.br
    Selecionar acesso para Administrador    ITAU
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
    Alterar o acesso para autorregulador
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao no perfil autorregulador
    Validar cadastro de 3 CNPJs diferentes para casca e classes    Evidencia_Cadastro_3_CNPJs_Diferentes