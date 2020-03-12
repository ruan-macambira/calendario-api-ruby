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

    context 'Métodos de Instância' do
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

    context 'Métodos de Classe' do
      let(:token) { ENV['CALENDARIO_API_TOKEN'] }
      it 'retorna feriados nacionais do ano', vcr: 'feriados/brasil_2020' do
        listagem = CalendarioApi::Feriado.listar(token, 2020)

        expect(listagem.count).to be > 0
        expect(listagem).to all(be_a CalendarioApi::Feriado)
      end

      it 'retorna os feriados nacionais e estaduais de um estado em um ano', vcr: 'feriados/brasil_sp_2020' do
        listagem = CalendarioApi::Feriado.listar_inclui_estado(token, 2020, 'DF')

        expect(listagem.count).to be > 0
        expect(listagem).to all(be_a CalendarioApi::Feriado)
        expect(listagem.map(&:tipo).uniq).to include('Feriado Nacional', 'Feriado Estadual')
        expect(listagem.map(&:tipo).uniq).to_not include('Feriado Municipal')
      end

      it 'retorna os feriados nacionais, estaduais e municipais', vcr: 'feriados/brasil_sp_sao_paulo_2020' do
        listagem = CalendarioApi::Feriado.listar_inclui_estado_cidade(token, 2020, 'DF', 'SAO_PAULO')

        expect(listagem.count).to be > 0
        expect(listagem).to all(be_a CalendarioApi::Feriado)
        expect(listagem.map(&:tipo).uniq).to include('Feriado Nacional', 'Feriado Estadual', 'Feriado Municipal')
      end

      context 'Token Inválido' do
        it 'lança um erro de autenticação', vcr: 'feriados/brasil_2020_notoken' do
          expect { CalendarioApi::Feriado.listar('', 2020) }
            .to raise_error(CalendarioApi::TokenInvalido)
        end
      end
    end
  end
end
