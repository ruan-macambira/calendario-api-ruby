require 'rest-client'
require_relative 'cidade_consulta'

module CalendarioApi
  # Classe que representa uma cidade
  class Cidade
    # @return [String] Nome da cidade
    attr_reader :nome

    # @return [String] Estado da Cidade
    attr_reader :estado

    # @return [String] Sigla do Estado da Cidade
    attr_reader :sigla_estado

    # Mapeamento das siglas dos estados e seus respectivos nomes em extenso
    ESTADO_POR_SIGLA = {
      'AC' => 'Acre', 'AL' => 'Alagoas', 'AP' => 'Amapá', 'AM' => 'Amazonas',
      'BA' => 'Bahia', 'CE' => 'Ceará', 'DF' => 'Distrito Federal',
      'ES' => 'Espírito Santo', 'GO' => 'Goiás', 'MA' => 'Maranhão',
      'MT' => 'Mato Grosso', 'MS' => 'Mato Grosso do Sul', 'MG' => 'Minas Gerais',
      'PA' => 'Pará', 'PB' => 'Paraíba', 'PR' => 'Paraná', 'PE' => 'Pernambuco',
      'PI' => 'Piauí', 'RJ' => 'Rio de Janeiro', 'RN' => 'Rio Grande do Norte',
      'RS' => 'Rio Grande do Sul', 'RO' => 'Rondônia', 'SC' => 'Santa Catarina',
      'SP' => 'São Paulo', 'SE' => 'Sergipe', 'TO' => 'Tocantins'
    }.freeze

    # Retorna uma nova instância de Cidade
    def initialize(nome, sigla_estado)
      @nome = nome
      @sigla_estado = sigla_estado
      @estado = ESTADO_POR_SIGLA[sigla_estado]
    end

    def to_s
      "#{@nome}-#{@sigla_estado}"
    end

    # Faz a comparação entre estados primeiro, e cidade depois
    def <=>(other)
      compara_estados = estado <=> other.estado
      return compara_estados unless compara_estados.zero?

      nome <=> other.nome
    end
  end
end
