require 'json'
require 'rest-client'
require_relative 'cidade'
require_relative 'cidade_resposta'

module CalendarioApi
  # Classe que faz a consulta na API de Cidades
  class CidadeConsulta
    # URL Base da API de Cidades
    URL_CIDADES = 'http://www.calendario.com.br/api/cities.json'.freeze

    # Faz a busca das cidades do país
    #
    # Não há parâmetros pois esta página não precisa de autenticação para acessar
    # nem há parâmetros a serem inseridos nela.
    # @return [CidadeResposta] Cidades do País
    def busca
      get = RestClient.get URL_CIDADES
      estados = JSON.parse(get.body)

      CidadeResposta.new(
        estados.map do |sigla_estado, cidades|
          cidades.map do |cidade|
            Cidade.new cidade, sigla_estado
          end
        end.flatten
      )
    end
  end
end
