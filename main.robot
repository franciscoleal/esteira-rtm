*** Settings ***
Library     Browser
Library     SeleniumLibrary
# Library     Selenium2Library
Library     Process
Library     Dialogs
Library     ScreenCapLibrary    # Precisa instalar essa library quando baixa em pc novo
Library     OperatingSystem
Library     DateTime
Library     Collections
Library     ExcelLibrary    # Precisa instalar essa library quando baixa em pc novo
Library     String
Library     FakerLibrary    locale=pt_BR    # Precisa instalar essa library quando baixa em pc novo, e instalar o "pip install setuptools"
# Library     ImageRobot
# Library     XML
# Library     RPA.Tables    # Precisa instalar a rpaframework
# Library     RPA.JavaAccessBridge    access_bridge_path=C:\Program Files\Java\jre1.8.0_421\bin\WindowsAccessBridge-64.dll
# Library     ImapLibrary
# Library     RPA.Browser.Selenium
# Library     CSVLibrary
Library     JSONLibrary


# Keywords 
Resource    keywords/commons/commons.resource  
Resource    keywords/navegador/navegador-config.resource
Resource    keywords/menu-informes/menu-informes.resource
Resource    keywords/menu-fundos/menu-fundos.resource
Resource    keywords/preencher-cadastro/preencher-cadastro.resource
Resource    keywords/validar-processamento/validar-processamento.resource
Resource    keywords/commons/rentabilidade.resource
Resource    keywords/validacao-fluxo-excecao/validacao-fluxo-excecao.resource
Resource    keywords/upload-plcota/upload-plcota.resource
Resource    keywords/enviar-justificativa/enviar-justificativa.resource
Resource    keywords/novo-fundo/novo-fundo.resource
Resource    keywords/perfil/perfil-fundo-casca.resource
Resource    keywords/perfil/perfil-classe.resource
Resource    keywords/perfil/perfil-subclasse.resource
Resource    keywords/cadastrar-fundo-casca/cadastrar-fundo-casca.resource
Resource    keywords/cadastrar-classe/cadastrar-classe.resource
Resource    keywords/cadastrar-subclasse/cadastrar-subclasse.resource
Resource    keywords/dados-cadastrais/dados-cadastrais-fundo-casca.resource
Resource    keywords/dados-cadastrais/dados-cadastrais-classe.resource
Resource    keywords/dados-cadastrais/dados-cadastrais-subclasse.resource
Resource    keywords/prestadores/prestadores-fundo-casca.resource
Resource    keywords/prestadores/prestadores-classe.resource
Resource    keywords/prestadores/prestadores-subclasse.resource
Resource    keywords/documentos/documentos-fundo-casca.resource
Resource    keywords/taxas/classe-taxas.resource
Resource    keywords/taxas/classe-taxa-administracao.resource
Resource    keywords/taxas/subclasse-taxas.resource
Resource    keywords/taxas/subclasse-taxa-administracao.resource
Resource    keywords/valor-minimo-movimentacao/valor-minimo-movimentacao.resource
Resource    keywords/validar-detalhes-fundo/validar-detalhes-fundo.resource
Resource    keywords/validar-fundo-analise/validar-fundo-analise.resource
Resource    keywords/validar-taxas-classe/validar-taxas-classe.resource
Resource    keywords/cadastrar-classe-adicional/cadastrar-classe-adicional.resource
Resource    keywords/carregar-json/carregar-json.resource
Resource    keywords/fundo-casca-completo-subclasse/fundo-casca-completo-subclasse.resource
Resource    keywords/aprovar-registro/aprovar-registro.resource
Resource    keywords/filtrar-registrados-por-cnpj/filtrar-registrados-por-cnpj.resource
Resource    keywords/analise-de-registro/analise-de-registro.resource
Resource    keywords/analise-de-registro/analise-de-registro-inconsistencia.resource
Resource    keywords/validar-analise-registro/validar-analise-registro.resource
Resource    keywords/acesso-autorregulador/acesso-autorregulador.resource
Resource    keywords/desabilitar-taxas-classe/desabilitar-taxas-classe.resource
Resource    keywords/subclasse-sem-taxas/subclasse-sem-taxas.resource
Resource    keywords/taxas/subclasse-sem-taxas-globais.resource
Resource    keywords/taxas/subclasse-sem-taxas-administracao.resource
Resource    keywords/taxas/subclasse-sem-taxas-gestao.resource
Resource    keywords/taxas/subclasse-sem-taxas-custodia.resource
Resource    keywords/taxas/subclasse-sem-taxas-distribuicao.resource
Resource    keywords/taxas/subclasse-sem-taxas-performance.resource
Resource    keywords/taxas/subclasse-sem-taxas-entrada-esaida.resource
Resource    keywords/taxas/subclasse-sem-taxas-consultoria-especializada.resource
Resource    keywords/alterar-fundo-aprovado/alterar-fundo-aprovado.resource
Resource    keywords/analisar-alteracao/analisar-alteracao.resource
Resource    keywords/validar-apontamento/validar-apontamento-inconsistencia.resource
Resource    keywords/filtrar-solicitacoes-por-cnpj/filtrar-solicitacoes-por-cnpj.resource
Resource    keywords/filtrar-por-numero-solicitacao/filtrar-por-numero-solicitacao.resource
Resource    keywords/enviar-inconsistencias/enviar-inconsistencias.resource
Resource    keywords/verificar-inconsistencia/verificar-inconsistencia.resource
Resource    keywords/enviar-analise-anbima/enviar-analise-anbima.resource
Resource    keywords/numero-solicitacao/numero-solicitacao.resource
Resource    keywords/inconsistir/subclasse-taxa-global-cobra-taxa-global.resource
Resource    keywords/habilitar-taxas-subclasse/habilitar-taxas-subclasse.resource
Resource    keywords/perfil/perfil-classe-multimercado.resource
Resource    keywords/aprovar-alteracao/aprovar-alteracao.resource
Resource    keywords/input-dados/input-dados.resource
Resource    keywords/cadastro-completo-plcota/cadastro-completo-plcota.resource
Resource    keywords/validar-exigencia-180-dias/validar-exigencia-180-dias.resource
Resource    keywords/validar-processamento-informe/validar-processamento-informe.resource
Resource    keywords/diferente-ultimo-dia-mes/diferente-ultimo-dia-mes.resource
Resource    keywords/validar-diferente-ultimo-dia-mes/validar-diferente-ultimo-dia-mes.resource
Resource    keywords/igual-ultimo-dia-mes/igual-ultimo-dia-mes.resource
Resource    keywords/validar-aprovacao-fundo/validar-aprovacao-fundo.resource
Resource    keywords/alterar-status-encerramento/alterar-status-encerramento.resource
Resource    keywords/filtro-avancado-registrado/filtro-avancado-registrado.resource
Resource    keywords/filtro-avancado-solicitacao/filtro-avancado-solicitacao.resource





# taxas
Resource    keywords/taxas/classe-taxa-global.resource
Resource    keywords/taxas/classe-taxa-gestao.resource
Resource    keywords/taxas/classe-taxa-custodia.resource
Resource    keywords/taxas/classe-taxa-distribuicao.resource
Resource    keywords/taxas/classe-taxa-performance.resource
Resource    keywords/taxas/classe-taxa-consultoria-especializada.resource   
Resource    keywords/taxas/classe-taxa-entrada-esaida.resource

Resource    keywords/taxas/subclasse-taxa-gestao.resource
Resource    keywords/taxas/subclasse-taxa-global.resource
Resource    keywords/taxas/subclasse-taxa-custodia.resource
Resource    keywords/taxas/subclasse-taxa-distribuicao.resource
Resource    keywords/taxas/subclasse-taxa-performance.resource
Resource    keywords/taxas/subclasse-taxa-entrada-esaida.resource
Resource    keywords/taxas/subclasse-taxa-consultoria-especializada.resource

# Resources
Resource    resources/auth/login.resource
Resource    resources/auth/profile.resource

Resource    keywords/Keywords.robot
# Resource    Massa/GlobalKeywords.robot

# Locators
Variables    locators/menu-informes/menu-informes.yaml
Variables    locators/auth/acesso.yaml
Variables    resources/data/datas_informes.yaml



Variables    resources/data/fif-multimercado-monoclasse.yaml
Variables    resources/data/fif-multimercado-multiclasse.yaml
# Variables    locators/envio-informes/envio-informes.yaml

Variables    ${CURDIR}${/}resources${/}auth${/}export-env.py    

*** Variables ***    # Variáveis globais
# ${LINK_HUB}    https://hubanbima-qa.rtm.net.br/    #Link para acessar o HUB QA
${LINK_HUB_CERT}    https://hubanbima-cert.rtm.net.br/    # Link para acessar o HUB CERT
${LINK_HUB_UAT}     https://hubanbima-uat.rtm.net.br/    # Link para acessar o HUB UAT
# ${LINK_HUB_V13}    https://hubanbima-qa-v13.rtm.net.br/    #Link para acessar o HUB V13
# ${LINK_HUB_V13}    https://hubanbima-uat-v13.rtm.net.br/    #Link para acessar o HUB V13
${LINK_HUB_DEV}     https://hubanbima-dev.rtm.net.br/    # Link para acessar o HUB DEV
${LINK_HUB_CERT_MER}     https://hubanbima-cert-mercado.rtm.net.br/    # Link para acessar o HUB CERT MERCADO
${LINK_HUB_PROD}    https://hubanbima.rtm.net.br/    # Link para acessar o HUB PRODUÇÃO

${LINK_HUB_DEV_V13}    https://hubanbima-dev-v13.rtm.net.br/
${LINK_HUB_V14}    https://hubanbima-cert-feature.rtm.net.br