*** Settings ***
Documentation      Essa automação valida acesso ao encerramento Fundo/Classe/Subclasse

Resource           ../../../Keywords/Keywords.robot
Resource           ../../../../main.robot
Resource           ../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Encerramento de Fundos] [Teste01] Validar acesso ao encerramento Fundo/Classe/Subclasse
    [Tags]    aprovacao
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
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
    Validar acesso ao Encerramento em Ações
    