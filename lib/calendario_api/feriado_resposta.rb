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

    def filtrar_mes(*meses)
      FeriadoResposta.new(@colecao.select { |data| meses.include? data.data.month })
    end
  end
end
