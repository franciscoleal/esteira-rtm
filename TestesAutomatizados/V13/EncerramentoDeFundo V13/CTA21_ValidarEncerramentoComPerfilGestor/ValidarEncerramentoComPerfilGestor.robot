*** Settings ***
Documentation      Essa automação valida encerramento de um fundo com perfil Gestor igual ao CNPJ logado

Resource           ../../../Keywords/Keywords.robot
Resource           ../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test21] Validar encerramento de um fundo com perfil Gestor igual ao CNPJ logado
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Criar fundo casca valido completo com subclasse Multimercado V13
    Enviar para analise anbima v13
    Get Register Number
    Alterar o perfil    Autorregulador    ANBIMA    1
    Clicar na opção fundos V13    Solicitações
    Filtrar fundo por numero da solicitacao no perfil autorregulador
    Acessar solicitacao
    Acessar analise de cadastro
    Aprovar registro
    Validar aprovacao do registro    FIF
    Alterar o perfil    Gestor    ITAU UNIBANCO SA    1
    Clicar na opção fundos V13    Registrados
    Filtrar por CNPJ registrados    Ativo
    Alterar status para encerramento
    Alterar o perfil    Autorregulador    ANBIMA    1
    Clicar na opção fundos V13
    Filtrar por CNPJ    Aguardando análise anbima
    Acessar solicitacao encerramento
    Acessar analise de encerramento
    Aprovar encerramento
    Validar aprovacao do encerramento gestor    Evidencia_Sucesso_Aprovacao_Encerramento