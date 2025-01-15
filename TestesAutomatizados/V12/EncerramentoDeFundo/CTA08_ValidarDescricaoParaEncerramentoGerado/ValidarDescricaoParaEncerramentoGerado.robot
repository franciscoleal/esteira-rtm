*** Settings ***
Documentation      Essa automação valida descrição salva para o encerramento gerado

Resource           ../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Encerramento de Fundos] [Teste08] Validar descrição salva para o encerramento gerado
    [Tags]    teste08
    Acessar o HUB    joao.marques-ext@anbima.com.br
    Criar fundo casca valido completo com subclasse
    Selecionar Sysadmin
    Filtro na tela inicial com numero
    Aprovar registro por administrador com numero
    Clicar na opção fundos    Registrados
    Pesquisar fundo no registrado
    Clicar na acao encerramento
    Encerrar fundo
