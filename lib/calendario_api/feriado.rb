require 'rest-client'
require_relative 'feriado_consulta'

module CalendarioApi
  class Feriado
    attr_reader :nome, :tipo, :codigo_tipo, :data, :link, :descricao

    def self.busca_feriados(hash_params = {})
      params = FeriadoParams.new hash_params
      FeriadoConsulta.new(params.token).busca_por_parametros(
        params.ano, params.estado, params.cidade
      )
    end

    def initialize(params = {})
      @nome = params['name']
      @tipo = params['type']
      @codigo_tipo = params['type_code'].to_i
      @data = Date.strptime(params['date'], '%d/%m/%Y')
      @link = params['link']
      @descricao = params['description']
    end
  end
end
