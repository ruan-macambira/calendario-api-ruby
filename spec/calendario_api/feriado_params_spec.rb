require 'calendario_api/feriado_params'

RSpec.describe CalendarioApi::FeriadoParams do

  context '#valid?' do
    it 'é um objeto válido' do
      params = build :feriado_params
      expect(params).to be_valid
    end

    it 'inválido por ausência de token' do
      params = build :feriado_params, token: nil
      expect(params).to_not be_valid
    end

    it 'inválido por token vazio' do
      params = build :feriado_params, token: ''
      expect(params).to_not be_valid
    end

    it 'inválido por ano não inteiro' do
      params = build :feriado_params do
        params = build :feriado_params, ano: 'dois mil e vinte'
        expect(params).to_not be_valid
      end
    end
  end
end
