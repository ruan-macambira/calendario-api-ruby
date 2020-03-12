require 'rest-client'
require_relative 'feriado_consulta'

module CalendarioApi
  class Feriado
    attr_reader :nome, :tipo, :codigo_tipo, :data, :link, :descricao

    def self.token=(token)
      @@token = token
    end

    def self.listar(ano)
      FeriadoConsulta.new(@@token).busca_por_ano(ano)
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