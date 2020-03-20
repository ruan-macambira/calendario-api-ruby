module CalendarioApi
  # Objeto que representa um feriado
  class Feriado
    # @return [String] Nome do Feriado. Ex.: Ano Novo
    attr_reader :nome

    # @return [String] Tipo de Data (Feriado Nacional, Feriado Estadual, etc.)
    attr_reader :tipo

    # @return [Integer] equivalente ao tipo de Data
    attr_reader :codigo_tipo

    # @return [Date] Data do Feriado
    attr_reader :data

    # @return [String] Link do site para o feriado
    attr_reader :link

    # #return [String] Descrição breve do Feriado
    attr_reader :descricao

    def initialize(params = {})
      @nome = params['name']
      @tipo = params['type']
      @codigo_tipo = params['type_code'].to_i
      @data = Date.strptime(params['date'], '%d/%m/%Y')
      @link = params['link']
      @descricao = params['description']
    end

    def <=>(other)
      date <=> other.date
    end
  end
end
