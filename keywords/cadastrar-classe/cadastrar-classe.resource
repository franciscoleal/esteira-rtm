*** Settings ***
Resource    ../../main.robot

*** Keywords ***
[Classe]Cadastrar Classe  
    Dados-Cadastrais-Classe.[Classe]Preencher os Dados Cadastrais da Classe
    Perfil-Classe.[Classe]Preencher Perfil da Classe
    IF    "${dados['Classe']['TaxasDaClasse']['PREENCHE_TAXAS_CLASSE']}" == "Não"
        Desabilitar-Taxas-Classe.Desabilitar preenchimento das Taxas da Classe  
    ELSE IF    "${dados['Classe']['TaxasDaClasse']['PREENCHE_TAXAS_CLASSE']}" == "Sim"
        Classe-Taxas.[Classe]Preencher Taxas da Classe
        Skip       
    END
    Prestadores-Classe.[Classe]Preencher os Prestadores da Classe 
    # Concluir classe com classe
    Commons.Wait And Click    //button[contains(.,'Concluir classe')]
    Sleep    2s
    # Iniciar cadastro subclasse
    Commons.Wait And Click    //button[contains(.,'Cadastrar subclasse')]    
