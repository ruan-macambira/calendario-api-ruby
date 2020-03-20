FactoryBot.define do
  factory :cidade, class: 'CalendarioApi::Cidade' do
    cidade { 'Cidade' }

    trait :sp do
      sigla_estado { 'SP' }
    end

    trait :rj do
      sigla_estado { 'RJ' }
    end

    trait :df do
      sigla_estado { 'DF' }
    end

    initialize_with { new(cidade, sigla_estado) }
  end
end
