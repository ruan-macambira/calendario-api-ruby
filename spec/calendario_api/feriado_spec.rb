# frozen_string_literal: true

require 'calendario_api/feriado'

RSpec.describe CalendarioApi::Feriado do

  context 'atributos' do
    subject(:ano_novo) do
      CalendarioApi::Feriado.new(
        'date' => Date.new(2017, 1, 1), 'name' => 'Ano Novo', 'type' => 'Feriado Nacional', 'type_code' => 1,
        'link' => 'http://www.calendario.com.br/feriados-nacionais/ano-novo.php', 'description' => 'Descrição Ano Novo'
      )
    end

    it '#nome' do
      expect(ano_novo.nome).to eq('Ano Novo')
    end

    it '#data' do
      expect(ano_novo.data).to eq(Date.new(2017, 1, 1))
    end

    it '#tipo' do
      expect(ano_novo.tipo).to eq('Feriado Nacional')
    end

    it '#codigo_tipo' do
      expect(ano_novo.codigo_tipo).to eq(1)
    end

    it '#link' do
      expect(ano_novo.link).to eq('http://www.calendario.com.br/feriados-nacionais/ano-novo.php')
    end

    it '#descricao' do
      expect(ano_novo.descricao).to eq('Descrição Ano Novo')
    end
  end
end
