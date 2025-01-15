*** Settings ***
Documentation      Essa automação tentar alterar fundo com status diferente de "Ativo"

Resource           ../../../Keywords/Keywords.robot
Resource    ../../../../main.robot
Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Alteração Validação regras][Test42] Validar a inclusão de Classe no fundo monoclasse alterando o CNPJ do fundo e CNPJ novo para a classe criada
    [Tags]    test42
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
    Clicar em Alteração em Ações
    Clicar em Adicionar nova classe
    Preencher os dados cadastrais de nova classe FIDC
    Preencher perfil da classe com alterações FIF V13    Ações    Ações    Ações Investimento Exterior    Investimento_Exterior    Investimento_Exterior
    Preencher taxas da classe em alteração V13
    Preencher os prestadores da classe FIF/FIDC
    Concluir classe sem subclasse
    Preencher perfil complementar FIF Renda Fixa alteração V13
    Preencher valor minimo e movimentacao
    Cadastrar prestadores complementar
    Enviar para analise anbima a alteração
    Clicar na opção fundos
    Filtrar por CNPJ    ${CNPJ_VALIDO}
    Validação alteração fundo casca documentos