*** Settings ***
Documentation      Essa automação valida tela de Encerramento e funcionalidades Botão "Encerrar Classe"

Resource           ../../../Keywords/Keywords.robot
Resource           ../../../../main.robot
Resource           ../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Encerramento de Fundos] [Teste06] Validar tela de Encerramento e funcionalidades Botão "Encerrar Classe"
    [Tags]    teste06
    Acessar o HUB    ${EMAIL}
    Criar fundo casca valido completo com subclasse FIF V13
    Enviar para analise anbima
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Acessar analise de cadastro
    Aprovar registro
    Alterar acesso para administrador
    Filtrar registrados
    Clicar em Encerramento em Ações
    Validar acesso Ações Encerrar