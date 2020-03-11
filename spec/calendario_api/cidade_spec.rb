require 'calendario_api/cidade'

RSpec.describe CalendarioApi::Cidade do
  it 'nome da cidade' do
    expect(CalendarioApi::Cidade.new('Brasília').to_s).to eq('Brasília')
  end
end
