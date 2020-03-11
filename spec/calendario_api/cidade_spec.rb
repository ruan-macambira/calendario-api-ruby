require 'calendario_api/cidade'

RSpec.describe CalendarioApi::Cidade do
  subject(:brasilia) { CalendarioApi::Cidade.new('Brasília', 'DF') }
  subject(:sao_paulo) { CalendarioApi::Cidade.new('São Paulo', 'SP') }

  context 'Métodos de Instância' do
    it 'nome da cidade' do
      expect(brasilia.nome).to eq('Brasília')
    end

    it 'nome do estado' do
      expect(brasilia.estado).to eq('Distrito Federal')
      expect(sao_paulo.estado).to eq('São Paulo')
    end

    it 'sigla do estado' do
      expect(brasilia.sigla_estado).to eq('DF')
    end

    it 'nome e sigla do estado' do
      expect(brasilia.to_s).to eq('Brasília-DF')
    end
  end
end
