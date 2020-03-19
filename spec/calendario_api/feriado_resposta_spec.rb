require 'calendario_api/feriado_resposta'

RSpec.describe CalendarioApi::FeriadoResposta do
  subject(:listagem) do
    CalendarioApi::FeriadoResposta.new(
      build_list(:feriado, 4, :janeiro) +
      build_list(:feriado, 5, :fevereiro) +
      build_list(:feriado, 6, :marco)
    )
  end

  it 'filtra por mês' do
    filtro = listagem.filtrar_mes(1)
    expect(filtro.count).to eq(4)
    expect(filtro.first.data.month).to eq(1)
  end

  it 'filtra mais de um mês' do
    filtro = listagem.filtrar_mes(1, 2)
    expect(filtro.count).to eq(9)
    expect(filtro.first.data.month).to eq(1).or(eq(2))
  end

  it 'encadeia filtros' do
    filtro = listagem.filtrar_mes(2, 3).filtrar_mes(2)
    expect(filtro.count).to eq(5)
    expect(filtro.first.data.month).to eq(2)
  end
end
