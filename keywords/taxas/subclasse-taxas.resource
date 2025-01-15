*** Settings ***
Resource    ../../main.robot

*** Keywords ***
[SubClasse]Preencher taxas de SubClasse
    [Documentation]    Padrão do argumento TAXACOMPOSICAOGLOBAL = Selecionar todos, caso precise passar valores diferentes, segue abaixo as opções:
    ...                Administracao-Gestao; Administracao-Distribuicao; Gestao-Distribuicao;
    SubClasse-Taxa-Global.Preencher as taxas Globais da SubClasse
    SubClasse-Taxa-Administracao.Preencher as taxas de Administração da SubClasse
    SubClasse-Taxa-Gestao.Preencher as taxas de Gestao da SubClasse
    SubClasse-Taxa-Distribuicao.Preencher as taxas de Distribuicao da SubClasse
    SubClasse-Taxa-Custodia.Preencher as taxas de Custodia da SubClasse
    SubClasse-Taxa-Performance.Preencher as taxas de Performance SubClasse
    SubClasse-Taxa-Entrada-ESaida.Preencher as taxas de Entrada e Saida da SubClasse
    SubClasse-Taxa-Consultoria-Especializada.Preencher as taxas de Consultoria Especializada SubClasse
    