require 'net/http'
require 'json'
require 'yandex_dictionary/responce_parse_service'
require 'yandex_dictionary/yandex_dictionary_api'

module YandexDictionary
  def self.translate(text, from, to)
    if text.scan(/ /).count > 0
      raise 'Text for translation should be one word'
    else
      ResponceParseService.parse_translation(YandexDictionaryApi.translate(text, from, to))
    end
  end

  def self.get_languages
    ResponceParseService.parse_languages(YandexDictionaryApi.get_directions)
  end
end
