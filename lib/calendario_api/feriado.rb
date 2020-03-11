module CalendarioApi
  class Feriado
    attr_reader :nome, :tipo, :codigo_tipo, :data, :link, :descricao

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