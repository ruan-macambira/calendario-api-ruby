require 'rest-client'
require_relative 'cidade_consulta'

module CalendarioApi
  class Cidade
    attr_reader :nome
    attr_reader :estado
    attr_reader :sigla_estado

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

    def self.listar
      CidadeConsulta.new.busca_e_filtra(nil)
    end

    def self.filtrar_estado(*siglas_estados)
      CidadeConsulta.new.busca_e_filtra(siglas_estados)
    end

    def initialize(nome, sigla_estado)
      @nome = nome
      @sigla_estado = sigla_estado
      @estado = ESTADO_POR_SIGLA[sigla_estado]
    end

    def to_s
      "#{@nome}-#{@sigla_estado}"
    end
  end
end
