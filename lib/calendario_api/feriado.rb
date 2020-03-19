require 'rest-client'
require_relative 'feriado_consulta'

module CalendarioApi
  class Feriado
    attr_reader :nome, :tipo, :codigo_tipo, :data, :link, :descricao

    def self.busca_feriados(params = {})
      FeriadoConsulta.new(params[:token].to_s).busca_por_parametros(
        params[:ano].to_s, params[:estado].to_s, params[:cidade].to_s
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
