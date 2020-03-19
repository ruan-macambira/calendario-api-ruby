# frozen_string_literal: true

require 'calendario_api/feriado'

RSpec.describe CalendarioApi::Feriado do
  let(:token) { ENV['CALENDARIO_API_TOKEN'] }
  subject(:feriados_2020) { CalendarioApi::Feriado.busca_feriados token: token, ano: 2020 }

  context 'Métodos de Instância', vcr: 'feriados/brasil_2020' do
    it '#nome' do
      expect(feriados_2020.map(&:nome)).to all(be_a String)
    end

    it '#data' do
      expect(feriados_2020.map(&:data)).to all(be_a Date)
    end

    it '#tipo' do
      expect(feriados_2020.map(&:tipo)).to all(be_a String)
    end

    it '#codigo_tipo' do
      expect(feriados_2020.map(&:codigo_tipo)).to all(be_a Integer)
    end

    it '#link' do
      expect(feriados_2020.map(&:link)).to all(be_a String)
    end

    it '#descricao' do
      expect(feriados_2020.map(&:descricao)).to all(be_a String)
    end
  end

  context 'Métodos de Classe' do
    it 'retorna feriados nacionais do ano', vcr: 'feriados/brasil_2020' do
      listagem = CalendarioApi::Feriado.busca_feriados token: token, ano: 2020

      expect(listagem.count).to be > 0
      expect(listagem.map(&:tipo).uniq).to include('Feriado Nacional')
    end

    it 'retorna os feriados nacionais e estaduais', vcr: 'feriados/brasil_sp_2020' do
      listagem = CalendarioApi::Feriado.busca_feriados token: token, ano: 2020, estado: 'SP'

      expect(listagem.count).to be > 0
      expect(listagem.map(&:tipo).uniq).to include('Feriado Nacional', 'Feriado Estadual')
      expect(listagem.map(&:tipo).uniq).to_not include('Feriado Municipal')
    end

    it 'retorna os feriados nacionais e municipais', vcr: 'feriados/brasil_sao_paulo_2020' do
      listagem = CalendarioApi::Feriado.busca_feriados token: token, ano: 2020, cidade: 'SAO_PAULO'
      expect(listagem.map(&:tipo).uniq).to include('Feriado Nacional', 'Feriado Municipal')
      expect(listagem.map(&:tipo).uniq).to_not include('Feriado Estadual')
    end

    it 'retorna os feriados nacionais, estaduais e municipais', vcr: 'feriados/brasil_sp_sao_paulo_2020' do
      listagem = CalendarioApi::Feriado.busca_feriados token: token, ano: 2020, estado: 'SP', cidade: 'SAO_PAULO'

      expect(listagem.count).to be > 0
      expect(listagem.map(&:tipo).uniq).to include('Feriado Nacional', 'Feriado Estadual', 'Feriado Municipal')
    end

    context 'Token Inválido' do
      it 'lança um erro de autenticação', vcr: 'feriados/brasil_2020_notoken' do
        expect { CalendarioApi::Feriado.busca_feriados ano: 2020 }
          .to raise_error(CalendarioApi::TokenInvalido)
      end
    end
  end
end
