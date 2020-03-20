# frozen_string_literal: true

require 'calendario_api/cidade_resposta'

RSpec.describe CalendarioApi::CidadeResposta, vcr: 'cidades' do
  subject(:listagem) do
    CalendarioApi::CidadeResposta.new(
      build_list(:cidade, 5, :sp) +
      build_list(:cidade, 6, :rj) +
      build_list(:cidade, 7, :df)
    )
  end

  it 'listar todas as cidades de um estado' do
    cidades_sp = listagem.filtrar_estados('SP')
    expect(cidades_sp.count).to eq 5
    expect(cidades_sp.map(&:sigla_estado)).to all(eq('SP'))
  end

  it 'listar todas as cidades de mais de um estado' do
    cidades_ufs = subject.filtrar_estados('SP', 'RJ')
    expect(cidades_ufs.count).to eq 11
    expect(cidades_ufs.map(&:sigla_estado).uniq).to contain_exactly('SP', 'RJ')
  end

  it 'não listar cidades se não especificar um estado' do
    sem_cidades = subject.filtrar_estados
    expect(sem_cidades.count).to eq 0
  end
end
