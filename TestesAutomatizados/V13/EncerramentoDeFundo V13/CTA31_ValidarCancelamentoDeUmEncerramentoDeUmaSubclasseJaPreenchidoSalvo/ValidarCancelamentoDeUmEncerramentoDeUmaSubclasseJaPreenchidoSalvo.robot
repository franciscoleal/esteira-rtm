*** Settings ***
Documentation      Essa automação valida o cancelamento de um encerramento de uma Subclasse já preenchido e salvo no hub

Resource           ../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test31] Validar o cancelamento de um encerramento de uma Subclasse já preenchido e salvo no hub
    Acessar o HUB    daniele.negoro@vericode.com.br
    Validar perfil    Administrador
    Criar fundo casca valido completo com subclasse Renda Fixa V13
    Enviar para analise anbima v13
    Get Register Number
    Alterar o acesso para autorregulador
    Clicar na opção fundos V13    Solicitações
    Filtrar fundo por numero da solicitacao no perfil autorregulador
    Acessar solicitacao
    Acessar analise de cadastro
    Aprovar registro
    Validar aprovacao do registro    FIF
    Alterar o perfil    Administrador    ITAU UNIBANCO SA    1
    Clicar na opção fundos V13    Registrados
    Filtrar por CNPJ registrados    Ativo
    Salvar processo de encerramento
    Clicar na opção fundos V13    Registrados
    Filtrar por CNPJ registrados    Ativo
    Desfazer encerramento    Evidencia_Cancelamento_Encerramento