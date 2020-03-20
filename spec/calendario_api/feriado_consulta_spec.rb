RSpec.describe CalendarioApi::FeriadoConsulta do
  let(:token) { ENV['CALENDARIO_API_TOKEN'] }

  subject { CalendarioApi::FeriadoConsulta.new(token) }
  context '#busca_por_parametros', vcr: 'feriados/brasil_2020' do
    it 'retorna um objeto FeriadoResposta' do
      expect(subject.busca_por_parametros(2020, '', '')).to be_a CalendarioApi::FeriadoResposta
    end
  end
end
