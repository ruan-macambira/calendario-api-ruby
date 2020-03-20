require 'calendario_api/version'
require 'calendario_api/cidade_consulta'
require 'calendario_api/feriado_params'
require 'calendario_api/feriado_consulta'

# Módulo Único do uso da API de Feriados/Cidades
module CalendarioApi
  # Erro genérico das funções
  class Error < StandardError; end

  # Token de Acesso à API Inválido
  class TokenInvalido < Error; end

  # Limite de usos de cidade ultrapassado
  class LimiteUltrapassado < Error; end

  # Faz busca na API pelos feriados
  #
  # @param hash_params[Hash] os parâmetros da busca na API.
  #   token: (Obrigatório) Token de acesso a API de feriados
  #   ano: Ano dos feriados, padrão: ano atual
  #   estado: Estado em que se extrairá os feriados Estaduais
  #   cidade: Cidade em que se extrairá os feriados Municipais
  # @return [FeriadoResposta] uma coleção de Feriados que condizem
  #   com os parâmetros da busca
  # @raise [TokenInvalido] caso não envie um token, ou este seja inválido
  # @note a busca por cidade e estado é inclusiva, isto é, se estiver
  #   vazia, não virá Feriados Estaduais ou Municipais.
  # @todo Permitir a busca através do código IBGE da cidade
  def self.busca_feriados(hash_params = {})
    params = FeriadoParams.new hash_params
    FeriadoConsulta.new(params.token).busca_por_parametros(
      params.ano, params.estado, params.cidade
    )
  end

  # Faz busca na API pelas cidades
  #
  # @return [CidadeResposta] uma coleção de cidades do Brasil
  def self.busca_cidades
    CidadeConsulta.new.busca
  end
end
