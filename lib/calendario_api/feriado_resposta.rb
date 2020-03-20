module CalendarioApi
  class FeriadoResposta
    include Enumerable

    def initialize(colecao)
      @colecao = colecao
    end

    def each(&block)
      @colecao.each do |member|
        block.call(member)
      end
    end

    # Filtra os resultados por mês
    #
    # @param meses meses a filtrar, em inteiro, Ex.: 1, 2
    # @return [FeriadoResposta] Coleção de Feriados filtrados por mês
    # @todo Aceitar Strings do mês como parâmetro
    # @todo Aceitar Symbols do mês como parâmetro
    def filtrar_mes(*meses)
      FeriadoResposta.new(@colecao.select { |data| meses.include? data.data.month })
    end
  end
end
