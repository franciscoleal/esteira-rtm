*** Settings ***
Documentation      Essa automação valida campos atrelados na edição de um fundo em rascunho - Prazo de duração (casca e classe)

Resource           ../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Test026]Validar campos atrelados na edição de um fundo em rascunho - Prazo de duração (casca e classe)
    Acessar o HUB    vimerson.miura@vericode.com.br
    Selecionar acesso para Administrador    ITAU
    Criar fundo casca valido completo com subclasse ETF
    Editar campos atrelados ao prazo duracao Casca
    Concluir edicao rascunho casca
    Editar campos atrelados ao prazo duracao Classe
    Concluir edicao rascunho classe
    Validar edicao campos atrelados ao prazo duracao Casca    Evidencia_Campos_Atrelados_Prazo_Duracao_Casca
    Validar edicao campos atrelados ao prazo duracao Classe    Evidencia_Campos_Atrelados_Prazo_Duracao_Classe
