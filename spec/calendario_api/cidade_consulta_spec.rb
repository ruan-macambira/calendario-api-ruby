# frozen_string_literal: true

require 'calendario_api/cidade_consulta'

RSpec.describe CalendarioApi::CidadeConsulta, vcr: 'cidades' do
  it 'listar todas as cidades' do
    listagem = subject.busca_e_filtra(nil)
    expect(listagem.count).to be > 0
    expect(listagem.first).to be_a(CalendarioApi::Cidade)
  end

  it 'listar todas as cidades de um estado' do
    cidades_sp = subject.busca_e_filtra(['SP'])
    expect(cidades_sp.count).to be > 0
    expect(cidades_sp.map(&:sigla_estado)).to all(eq('SP'))
  end

  it 'listar todas as cidades de mais de um estado' do
    cidades_ufs = subject.busca_e_filtra(%w[SP RJ])
    expect(cidades_ufs.count).to be > 0
    expect(cidades_ufs.map(&:sigla_estado).uniq).to contain_exactly('SP', 'RJ')
  end

  it 'não listar cidades se não especificar um estado' do
    sem_cidades = subject.busca_e_filtra([])
    expect(sem_cidades.count).to eq 0
  end
end
