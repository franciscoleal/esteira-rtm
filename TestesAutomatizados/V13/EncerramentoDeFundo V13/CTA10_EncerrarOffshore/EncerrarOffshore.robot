*** Settings ***
Documentation      Essa automação realiza encerramento de Offshore

Resource           ../../../Keywords/Keywords.robot
Resource           ../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test09] Encerrar Offshore    ###Erro na hora de criar um fundo Offshore
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Criar fundo casca valido completo com subclasse OFFSHORE V13
    Enviar para analise anbima v13
    Get Register Number
    Alterar o acesso para autorregulador
    Clicar na opção fundos V13    Solicitações
    Filtrar fundo por numero da solicitacao no perfil autorregulador
    Acessar solicitacao
    Acessar analise de cadastro
    Aprovar registro
    Validar aprovacao do registro    Offshore
    Alterar acesso para administrador
    Clicar na opção fundos V13    Registrados
    Filtrar Offshore registrados    Ativo    teste
    Alterar status para encerramento
    Alterar o acesso para autorregulador
    Clicar na opção fundos V13
    Filtrar Offshore registrados Autorregulador    Aguardando análise anbima    teste
    Acessar solicitacao encerramento
    Acessar analise de encerramento
    Aprovar encerramento
    Validar aprovacao do encerramento offshore    Evidencia_Sucesso_Aprovacao_Encerramento