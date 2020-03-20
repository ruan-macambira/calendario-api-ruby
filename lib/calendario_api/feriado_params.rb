module CalendarioApi
  # Empacota e valida os parâmetros da busca para a API de Feriados
  class FeriadoParams
    # @return [String] Token da API
    attr_reader :token

    # @return [Integer] Ano
    attr_reader :ano

    # @return [String] Estado
    attr_reader :estado

    # @return [String] Cidade
    attr_reader :cidade

    # Retorna uma nova instância de FeriadoParams
    def initialize(params = {})
      @token = (params['token'] || params[:token]).to_s
      @ano = (params['ano'] || params[:ano]).to_i
      @estado = (params['estado'] || params[:estado]).to_s
      @cidade = (params['cidade'] || params[:cidade]).to_s
    end

    # Determina se os parâmetros são válidos para fazer uma requisição
    def valid?
      return false if @token.nil?
      return false if @token.empty?
      return false unless @ano.respond_to? :to_i
      return false if @ano.to_i.zero?

      true
    end
  end
end
