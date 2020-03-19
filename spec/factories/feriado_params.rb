FactoryBot.define do
  factory :feriado_params, class: 'CalendarioApi::FeriadoParams' do
    token { ENV['CALENDARIO_API_TOKEN'] }
    ano { 2020 }
    estado { 'SP' }
    cidade { 'SAO_PAULO' }

    initialize_with { new(attributes) }
  end
end
