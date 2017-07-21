require 'net/http'
require 'json'

module YandexDictionarySDK
  class ResponceParseService
    def self.parse_translation(response)
      json_data = JSON.parse(response)
      result = Array.new
      # json_data['def'][0]['tr'].each do |translation|
      #   result.push(translation['text'])
      # end
      puts json_data
      return result
    end

    def self.parse_languages(response)
      response.gsub!(/[\[\]]/, '')
      response.split(',')
    end
  end

  class YandexDictionaryApi
    def self.get_directions
      uri = URI('https://dictionary.yandex.net/api/v1/dicservice.json/getLangs')

      params = {:key => "dict.1.1.20170720T072258Z.473cd5cb2f03e399.d84391b19a1bcaaf37399eb4979eb9e937879295"}
      uri.query = URI.encode_www_form(params)

      return Net::HTTP.get(uri)
    end

    def self.translate(text, from, to)
      lang = "#{from}-#{to}"

      uri = URI('https://dictionary.yandex.net/api/v1/dicservice.json/lookup')

      params = {:key => "dict.1.1.20170720T072258Z.473cd5cb2f03e399.d84391b19a1bcaaf37399eb4979eb9e937879295",
      :text => text,
      :lang => lang
      }

      uri.query = URI.encode_www_form(params)
      return Net::HTTP.get(uri)
    end
  end

  class YandexDictionary
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

  YandexDictionarySDK::YandexDictionary.get_languages
end
