*** Settings ***
Resource    ../../main.robot

*** Keywords ***
[SubClasse]Cadastrar SubClasse
    Dados-Cadastrais-SubClasse.[SubClasse]Preencher os Dados Cadastrais da SubClasse
    Perfil-SubClasse.[SubClasse]Preencher Perfil da SubClasse
    IF    "${dados['SubClasse']['TaxasDaSubClasse']['PREENCHE_TAXAS_SUBCLASSE']}" == "Sim"
        SubClasse-Taxas.[SubClasse]Preencher taxas de SubClasse   
    ELSE IF    "${dados['SubClasse']['TaxasDaSubClasse']['PREENCHE_TAXAS_SUBCLASSE']}" == "Não"
        SubClasse-Sem-Taxas.[SubClasse]Não Preencher Taxas na SubClasse
    END
    Valor-Minimo-Movimentacao.[SubClasse]Preencher valor minimo e movimentacao    TIPO=${dados['TIPO-VALOR-MINIMO']}
    Prestadores-SubClasse.[SubClasse]Preencher Prestadores da SubClasse
    