*** Settings ***
Resource    ../../main.robot

*** Keywords ***
[SubClasse]Não Preencher Taxas na SubClasse
    SubClasse-Sem-Taxas-Globais.Sem taxas Globais da SubClasse
    SubClasse-Sem-Taxas-Administracao.Sem taxas de Administração da SubClasse
    SubClasse-Sem-Taxas-Gestao.Sem taxas de Gestao da SubClasse
    SubClasse-Sem-Taxas-Distribuicao.Sem taxas de Distribuicao da SubClasse
    SubClasse-Sem-Taxas-Custodia.Sem taxas de Custodia da SubClasse
    SubClasse-Sem-Taxas-Performance.Sem taxas de Performance SubClasse
    SubClasse-Sem-Taxas-Entrada-ESaida.Sem taxas de Entrada e Saida da SubClasse
    SubClasse-Sem-Taxas-Consultoria-Especializada.Sem taxas de Consultoria Especializada SubClasse