*** Settings ***
Documentation      Essa automação valida Cadastro de mais um prestador de serviço para os papéis definidos como únicos "Classe"

Resource           ../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test33] Validar Cadastro de mais um prestador de serviço para os papéis definidos como únicos "Classe"
    Acessar o HUB    vimerson.miura@vericode.com.br
    Selecionar acesso para Administrador    ITAU
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIF Multimercado
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe    teste    teste
    Preencher perfil da classe tipo multimercado
    Preencher as taxas da classe
    Preencher mais prestadores da classe    Evidencia_Cadastro_Prestador_Servico