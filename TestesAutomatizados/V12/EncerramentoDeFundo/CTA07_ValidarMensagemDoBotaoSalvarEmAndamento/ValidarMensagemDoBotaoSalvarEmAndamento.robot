*** Settings ***
Documentation      Essa automação valida mensagem ao clicar no botão "salvar em andamento" no Encerramento

Resource           ../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Encerramento de Fundos] [Teste07] Validar mensagem ao clicar no botão "salvar em andamento" no Encerramento
    [Tags]    teste07
    Acessar o HUB    joao.marques-ext@anbima.com.br
    Criar fundo casca valido completo com subclasse
    Selecionar Sysadmin
    Filtro na tela inicial com numero
    Aprovar registro por administrador com numero
    Clicar na opção fundos    Registrados
    Pesquisar fundo no registrado
    Clicar na acao encerramento
    Validar mensagem do botao salvar em andamento
    Salvar em andamento no encerramento
