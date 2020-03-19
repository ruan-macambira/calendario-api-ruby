FactoryBot.define do
  factory :feriado, class: 'CalendarioApi::Feriado' do
    date { '01/01/2017' }
    name { 'Ano Novo' }
    description { 'Descrição Ano Novo' }
    type { 'Feriado Nacional' }
    type_code { '1' }
    link { 'http://www.calendario.com.br/feriados-nacionais/ano-novo.php' }

    initialize_with {
      new(
        'date' => date, 'name' => name, 'description' => description,
        'type_code' => type_code, 'type' => type, 'link' => link
      )
    }
  end
end
