module CalendarioApi
  class FeriadoConsulta
    URL_FERIADOS = 'https://api.calendario.com.br'

    def initialize(token)
      @token = token
    end

    def busca_por_ano(ano)
      busca_por_parametros(ano, '', '')
    end

    def busca_por_ano_estado(ano, estado)
      busca_por_parametros(ano, estado, '')
    end

    def busca_por_ano_estado_cidade(ano, estado, cidade)
      busca_por_parametros(ano, estado, cidade)
    end

    private

    def busca_por_parametros(ano, estado, cidade)
      consulta_api(ano, estado).map do |feriado|
        Feriado.new feriado
      end
    end

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