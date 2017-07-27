lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name        = 'yandex_dictionary'
  s.version     = '1'
  s.date        = '2017-07-20'
  s.summary     = "YandexDictionary API wrapper"
  s.email       = 'nick@quaran.to'
  s.files       = ["lib/yandex_dictionary.rb", "lib/yandex_dictionary/responce_parse_service.rb", "lib/yandex_dictionary/yandex_dictionary_api.rb","lib/yandex_dictionary/yandex_dictionary_request.rb", "lib/yandex_dictionary/secrets.rb"]
  s.authors     = ["Agafonov Maksim"]
  s.require_paths = ["lib"]
end
