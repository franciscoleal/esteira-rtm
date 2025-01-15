*** Settings ***
Resource    ../../main.robot

*** Variables ***
@{TAXACOMPOSICAOGLOBAL}    Administracao-Gestao    Administracao-Distribuicao    Gestao-Distribuicao

*** Keywords ***
[Classe]Preencher Taxas da Classe  
    Classe-Taxa-Global.Preencher as taxas globais da classe           
    Classe-Taxa-Administracao.Preencher as taxas de administração da classe
    Classe-Taxa-Gestao.Preencher as taxas de gestao da classe
    Classe-Taxa-Distribuicao.Preencher as taxas de distribuicao da classe
    Classe-Taxa-Custodia.Preencher as taxas de custodia da classe
    Classe-Taxa-Performance.Preencher as taxas de performance da classe        
    Classe-Taxa-Entrada-ESaida.Preencher as taxas de entrada e saida da classe
    Classe-Taxa-Consultoria-Especializada.Preencher as taxas de consultoria especializada da subclasse