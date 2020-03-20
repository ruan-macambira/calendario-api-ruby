module CalendarioApi
  class CidadeResposta
    include Enumerable

    def initialize(colecao)
      @colecao = colecao
    end

    def each(&block)
      @colecao.each do |member|
        block.call(member)
      end
    end

    # Filtra os resultados por sigla do estado
    #
    # @param estados estados a filtrar. Ex.: 'SP', 'RJ'
    # @return [CidadeResposta] Coleção de Cidades filtrados por estado
    # @todo Filtrar estados por Nome do Estado
    def filtrar_estados(*estados)
      CidadeResposta.new(@colecao.select { |cidade| estados.include? cidade.sigla_estado })
    end
  end
end
