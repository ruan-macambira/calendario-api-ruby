module CalendarioApi
  class FeriadoParams
    def initialize(params = {})
      @token = params['token'] || params[:token]
      @ano = params['ano'] || params[:ano]
      @estado = params['estado'] || params[:estado]
      @cidade = params['cidade'] || params[:cidade]
    end

    def valid?
      return false if @token.nil?
      return false if @token.empty?
      return false unless @ano.respond_to? :to_i
      return false if @ano.to_i.zero?

      true
    end

    def token
      @token.to_s
    end

    def ano
      @ano.to_i
    end

    def estado
      @estado.to_s
    end

    def cidade
      @cidade.to_s
    end
  end
end
