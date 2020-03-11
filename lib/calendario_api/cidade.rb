module CalendarioApi
  class Cidade
    attr_reader :nome

    def initialize(nome)
      @nome = nome
    end

    def to_s
      @nome
    end
  end
end
