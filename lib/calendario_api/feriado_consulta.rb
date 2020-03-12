module CalendarioApi
  class FeriadoConsulta
    URL_FERIADOS = 'https://api.calendario.com.br'

    def initialize(token)
      @token = token
    end

    def busca_por_ano(ano)
      feriados = consulta_api(ano)

      feriados.map do |feriado|
        Feriado.new feriado
      end
    end

    private

    def consulta_api(ano)
      get = RestClient.get(
        URL_FERIADOS,
        params: { token: @token, ano: ano, json: true }
      )

      begin
        JSON.parse(get.body)
      rescue JSON::ParserError
        raise TokenInvalido, 'Token Inválido'
      end
    end
  end
end