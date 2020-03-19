require 'calendario_api/version'
require 'calendario_api/feriado_params'
require 'calendario_api/feriado_consulta'

module CalendarioApi
  class Error < StandardError; end
  # Your code goes here...

  class TokenInvalido < Error; end

  class LimiteUltrapassado < Error; end

  def self.busca_feriados(hash_params = {})
    params = FeriadoParams.new hash_params
    FeriadoConsulta.new(params.token).busca_por_parametros(
      params.ano, params.estado, params.cidade
    )
  end
end
