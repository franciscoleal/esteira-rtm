*** Settings ***
Documentation      Essa automação tentar alterar fundo com status diferente de "Ativo"

Resource           ../../../Keywords/Keywords.robot
Resource    ../../../../main.robot
Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Alteração Validação regras][Test47] Validar a inclusão de novo Informante na Subclasse
    [Tags]    test47
    Acessar o HUB    ${EMAIL}
    Criar fundo casca valido completo com subclasse ETF V13
    Enviar para analise anbima
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Acessar analise de cadastro
    Aprovar registro
    Alterar acesso para administrador
    Filtrar registrados
    Clicar em Alteração em Ações
    Clicar em editar Subclasse
    Incluir tipo do prestador informante na Subclasse
    Enviar para analise anbima a alteração
    Alterar acesso para autorregulador      #dar continuidade daqui,parado devido ao bug na inconsistencia
    #proximo passo filtrar para ir ate Arovar alteração   Clicar na opção fundos / Filtrar por CNPJ    ${CNPJ_VALIDO}
    #aprovar alteração
    # alterar para  Alterar acesso para administrador  
    # voltar para registrados, ir ate fundo casca onde vai mostrar o Gestor alterado
    Validação alteração fundo casca documentos