require 'rest-client'
require_relative 'feriado_resposta'
require_relative 'feriado'

module CalendarioApi
  class FeriadoConsulta
    URL_FERIADOS = 'https://api.calendario.com.br'.freeze

    # Inicializa o objeto de consulta
    #
    # @param token [String] Token de Autenticação, provido pelo site (http://www.calendario.com.br)
    def initialize(token)
      @token = token
    end

    # Faz uma busca na API de Feriados
    #
    # @param ano [Integer] Inclui os feriados daquele ano
    # @param sigla_estado [String] Inlui os feriados estaduais daquele estado
    #   naquele ano (Necessário Usar Sigla)
    # @param cidade [String] Inclui os feriados municipais daquela cidade
    #   naquele ano
    def busca_por_parametros(ano, sigla_estado, cidade)
      FeriadoResposta.new(
        consulta_api(ano, sigla_estado, cidade).map do |feriado|
          Feriado.new feriado
        end
      )
    end

    private

    def consulta_api(ano, sigla_estado = '', cidade = '')
      get = RestClient.get(
        URL_FERIADOS,
        params: { token: @token, ano: ano, estado: sigla_estado, cidade: cidade, json: true }
      )

      begin
        JSON.parse(get.body)
      rescue JSON::ParserError
        raise TokenInvalido, 'Token Inválido'
      end
    end
  end
end
