# CalendarioApi

Wrapper da Api de Feriados Brasileiros de http://www.calendario.com.br/

## Instalação

Adicione essa linha na Gemfile da sua aplicação:

```` ruby
gem 'calendario_api'
````

E então execute:

````
    $ bundle
````

Ou instale você mesmo, conforme abaixo:
````
    $ gem install calendario_api
````

## Uso

Acesse http://www.calendario.com.br/api_feriados_municipais_estaduais_nacionais.php e peça uma chave de API. Sem uma chave, você não poderá utilizar a API de Feriados.  

```` ruby  
require 'calendario_api'

# Traz Feriados Nacionais do ano corrente
CalendarioApi.busca_feriados(token: '<TOKEN_VALIDO>')

# Traz Feriados Nacionais de 2020
CalendarioApi.busca_feriados(token: '<TOKEN_VALIDO>', ano: 2020)

# Traz Feriados Nacionais e Estaduais de SP em 2020
CalendarioApi.busca_feriados(token: '<TOKEN_VALIDO>', ano: 2020, estado: 'SP')

# Traz Feriados Nacionais, Estaduais de SP, e Municipais de São Paulo em 2020
CalendarioApi.busca_feriados(token: '<TOKEN_VALIDO>', ano: 2020, estado: 'SP', cidade: 'SAO_PAULO')
````

## Testando a Aplicação  
Os testes são feitos com [RSpec](https://github.com/rspec/rspec), [FactoryBot](https://github.com/thoughtbot/factory_bot), [WebMock](https://github.com/bblimke/webmock) e [VCR](https://github.com/vcr/vcr). Os testes que fazem requisições para a API e necessitam de API precisam possuir uma chave de API do site para que possam ser executados corretamente. Então, para executar os testes, utilize:

````
CALENDARIO_API_TOKEN=<TOKEN_VALIDO> bundle exec rspec
````

Que fará o VCR criar os arquivos que ele usará para executar os testes. Se você já tiver executado os testes e estiver recebendo uma exceção do VCR, verifique se o token utilizado é o mesmo que você usou para rodar os testes da primeira vez, e se ele está válido. Caso tenha feito os testes sem um token válido Remova os cassetes do seu repositório por meio de:
 ````
 rm spec/vcr_cassettes/ -r

 ````
 e rode os testes novamente com o token correto.

 Se você tem uma solução para poder os cassetes dentro do repositório sem a necessidade de utilizar uma chave de API para isso, fique à vontade para dar uma contribuição.

## Contribuindo
Reporte de Problemas e Pull Requests são bem-vindos no Github em https://github.com/MxBromelia/calendario-api-ruby.

## Licença

A Gem é disponível em código-aberto sobre os termos da [LIcença MIT](https://opensource.org/licenses/MIT).