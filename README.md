# CalendarioApi

Wrapper da Api de Feriados Brasileiros de http://www.calendario.com.br/

## Instalação

Adicione essa linha na Gemfile da sua aplicação:

```ruby
gem 'calendario_api'
```

E então execute:

    $ bundle

Ou instale você mesmo, conforme abaixo:

    $ gem install calendario_api

## Uso

Acesse http://www.calendario.com.br/api_feriados_municipais_estaduais_nacionais.php e peça uma chave de API. Sem uma chave, você não poderá utilizar a API de Feriados.

```ruby
require 'calendario_api'

# Traz Feriados Nacionais do ano corrente
CalendarioApi.busca_feriados(token: '<TOKEN_VALIDO>')

# Traz Feriados Nacionais de 2020
CalendarioApi.busca_feriados(token: '<TOKEN_VALIDO>', ano: 2020)

# Traz Feriados Nacionais e Estaduais de SP em 2020
CalendarioApi.busca_feriados(token: '<TOKEN_VALIDO>', ano: 2020, estado: 'SP')

# Traz Feriados Nacionais, Estaduais de SP, e Municipais de São Paulo em 2020
CalendarioApi.busca_feriados(token: '<TOKEN_VALIDO>', ano: 2020, estado: 'SP', cidade: 'SAO_PAULO')
```

## Contribuindo
Reporte de Problemas e Pull Requests são bem-vindos no Github em https://github.com/MxBromelia/calendario-api-ruby.

## Licença

A Gem é disponível em código-aberto sobre os termos da [LIcença MIT](https://opensource.org/licenses/MIT).