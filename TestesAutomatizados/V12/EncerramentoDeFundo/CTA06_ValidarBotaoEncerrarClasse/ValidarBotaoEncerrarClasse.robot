*** Settings ***
Documentation      Essa automação valida tela de Encerramento e funcionalidades Botão "Encerrar Classe"

Resource           ../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Encerramento de Fundos] [Teste06] Validar tela de Encerramento e funcionalidades Botão "Encerrar Classe"
    [Tags]    teste06
    Acessar o HUB    joao.marques-ext@anbima.com.br
    Criar fundo casca valido completo com subclasse
    Selecionar Sysadmin
    Filtro na tela inicial com numero
    Aprovar registro por administrador com numero
    Clicar na opção fundos    Registrados
    Pesquisar fundo no registrado
    Clicar na acao encerramento
    Validar botao encerrar classe