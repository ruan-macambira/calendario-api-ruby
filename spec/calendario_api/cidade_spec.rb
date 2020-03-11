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

  context 'Métodos de Classe', vcr: 'cidades' do
    it 'listar todas as cidades' do
      listagem = CalendarioApi::Cidade.listar
      expect(listagem.count).to be > 0
      expect(listagem.first).to be_a(CalendarioApi::Cidade)
    end

    describe '.filtrar_estado' do
      it 'listar todas as cidades de um estado' do
        cidades_sp = CalendarioApi::Cidade.filtrar_estado('SP')
        expect(cidades_sp.count).to be > 0
        expect(cidades_sp.map(&:sigla_estado)).to all(eq('SP'))
      end

      it 'listar todas as cidades de mais de um estado' do
        cidades_ufs = CalendarioApi::Cidade.filtrar_estado('SP', 'RJ')
        expect(cidades_ufs.count).to be > 0
        expect(cidades_ufs.map(&:sigla_estado).uniq).to contain_exactly('SP', 'RJ')
      end

      it 'não listar cidades se não especificar um estado' do
        sem_cidades = CalendarioApi::Cidade.filtrar_estado
        expect(sem_cidades.count).to eq 0
      end
    end
  end
end
