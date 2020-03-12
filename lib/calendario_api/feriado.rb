require 'rest-client'
require_relative 'feriado_consulta'

module CalendarioApi
  class Feriado
    attr_reader :nome, :tipo, :codigo_tipo, :data, :link, :descricao

    def self.listar(token, ano)
      FeriadoConsulta.new(token).busca_por_ano(ano)
    end

    def self.listar_inclui_estado(token, ano, estado)
      FeriadoConsulta.new(token).busca_por_ano_estado(ano, estado)
    end

    def self.listar_inclui_estado_cidade(token, ano, estado, cidade)
      FeriadoConsulta.new(token).busca_por_ano_estado_cidade(ano, estado, cidade)
    end

    def initialize(params = {})
      @nome = params['name']
      @tipo = params['type']
      @codigo_tipo = params['type_code']
      @data = params['date']
      @link = params['link']
      @descricao = params['description']
    end
  end
end