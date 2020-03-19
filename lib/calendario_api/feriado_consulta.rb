module CalendarioApi
  class FeriadoConsulta
    URL_FERIADOS = 'https://api.calendario.com.br'.freeze

    def initialize(token)
      @token = token
    end

    def busca_por_parametros(ano, estado, cidade)
      FeriadoResposta.new(
        consulta_api(ano, estado, cidade).map do |feriado|
          Feriado.new feriado
        end
      )
    end

    private

    def consulta_api(ano, estado = '', cidade = '')
      get = RestClient.get(
        URL_FERIADOS,
        params: { token: @token, ano: ano, estado: estado, cidade: cidade, json: true }
      )

      begin
        JSON.parse(get.body)
      rescue JSON::ParserError
        raise TokenInvalido, 'Token Inválido'
      end
    end
  end
end
