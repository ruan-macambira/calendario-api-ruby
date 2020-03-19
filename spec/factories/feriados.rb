FactoryBot.define do
  factory :feriado, class: 'CalendarioApi::Feriado' do
    name { 'Feriado' }
    description { 'Descrição' }
    type { 'Tipo' }
    type_code { '0' }
    link { 'http://www.calendario.com.br' }

    trait :ano_novo do
      date { '01/01/2017' }
      name { 'Ano Novo' }
      description { 'Descrição Ano Novo' }
      type { 'Feriado Nacional' }
      type_code { '1' }
      link { 'http://www.calendario.com.br/feriados-nacionais/ano-novo.php' }
    end

    trait :janeiro do
      date { "#{(1..31).to_a.sample}/01/2017" }
    end

    trait :fevereiro do
      date { "#{(1..28).to_a.sample}/02/2017" }
    end

    trait :marco do
      date { "#{(1..31).to_a.sample}/03/2017" }
    end

    initialize_with do
      new(
        'date' => date, 'name' => name, 'description' => description,
        'type_code' => type_code, 'type' => type, 'link' => link
      )
    end
  end
end
