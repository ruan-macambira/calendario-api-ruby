# frozen_string_literal: true

require 'calendario_api/feriado'

RSpec.describe CalendarioApi::Feriado do
  subject(:feriados_2020) { CalendarioApi.busca_feriados token: token, ano: 2020 }

  context 'Métodos de Instância' do
    subject(:feriado) { build :feriado, :ano_novo }

    it '#nome' do
      expect(feriado.link).to be_a String
      expect(feriado.nome).to eq('Ano Novo')
    end

    it '#data' do
      expect(feriado.data).to be_a Date
      expect(feriado.data).to eq(Date.new(2017, 1, 1))
    end

    it '#tipo' do
      expect(feriado.tipo).to be_a String
      expect(feriado.tipo).to eq('Feriado Nacional')
    end

    it '#codigo_tipo' do
      expect(feriado.codigo_tipo).to be_an Integer
      expect(feriado.codigo_tipo).to eq(1)
    end

    it '#link' do
      expect(feriado.link).to be_a String
      expect(feriado.link).to eq 'http://www.calendario.com.br/feriados-nacionais/ano-novo.php'
    end

    it '#descricao' do
      expect(feriado.descricao).to be_a String
      expect(feriado.descricao).to eq 'Descrição Ano Novo'
    end
  end
end
