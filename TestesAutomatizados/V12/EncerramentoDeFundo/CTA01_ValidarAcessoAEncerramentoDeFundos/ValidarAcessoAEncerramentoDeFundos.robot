*** Settings ***
Documentation      Essa automação valida acesso ao encerramento Fundo/Classe/Subclasse

Resource           ../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Encerramento de Fundos] [Teste01] Validar acesso ao encerramento Fundo/Classe/Subclasse
    [Tags]    teste01
    Acessar o HUB    joao.marques-ext@anbima.com.br
    Criar fundo casca valido completo com subclasse
    Selecionar Sysadmin
    Filtro na tela inicial com numero
    Aprovar registro por administrador com numero
    Clicar na opção fundos    Registrados
    Pesquisar fundo no registrado
    Validar botão alteracao e encerramento nas informacoes do fundo
    