RSpec.describe CalendarioApi::CidadeConsulta do
  context '#busca', vcr: 'cidades' do
    it 'retorna um objeto CidadeResposta' do
      expect(subject.busca).to be_an(CalendarioApi::CidadeResposta)
    end
  end
end