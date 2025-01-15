*** Settings ***
Documentation      Essa automação valida mensagem ao clicar no botão "salvar em andamento" no Encerramento

Resource           ../../../Keywords/Keywords.robot
Resource           ../../../../main.robot
Resource           ../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Encerramento de Fundos] [Teste07] Validar mensagem ao clicar no botão "salvar em andamento" no Encerramento
    [Tags]    teste07
    Acessar o HUB    ${EMAIL}
    Criar fundo casca valido completo com subclasse V13
    Enviar para analise anbima
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Acessar analise de cadastro
    Aprovar registro
    Alterar acesso para Administrador
    Filtrar registrados
    Clicar em Encerramento em Ações
    Validar botão Salvar andamento