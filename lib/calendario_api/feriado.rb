require 'rest-client'
require_relative 'feriado_consulta'

module CalendarioApi
  class Feriado
    attr_reader :nome, :tipo, :codigo_tipo, :data, :link, :descricao

    def initialize(params = {})
      @nome = params['name']
      @tipo = params['type']
      @codigo_tipo = params['type_code'].to_i
      @data = Date.strptime(params['date'], '%d/%m/%Y')
      @link = params['link']
      @descricao = params['description']
    end

    def <=>(other)
      return self.date <=> other.date
    end
  end
end
