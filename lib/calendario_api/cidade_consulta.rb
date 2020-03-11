module CalendarioApi
  class CidadeConsulta
    URL_CIDADES = 'http://www.calendario.com.br/api/cities.json'.freeze

    def busca_e_filtra(filtro_estados)
      get = RestClient.get URL_CIDADES
      estados = JSON.parse(get.body)

      estados_filtrados = filtra_estados(estados, filtro_estados)

      estados_filtrados.map do |sigla_estado, cidades|
        cidades.map do |cidade|
          Cidade.new cidade, sigla_estado
        end
      end.flatten
    end

    private

    def filtra_estados(estados, filtro)
      return estados if filtro.nil?

      estados.select do |sigla_estado|
        filtro.include? sigla_estado
      end
    end
  end
end