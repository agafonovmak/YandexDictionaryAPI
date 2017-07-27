require 'yandex_dictionary/secrets'
require 'yandex_dictionary/yandex_dictionary_request'
module YandexDictionary
  class YandexDictionary::YandexDictionaryApi
    def self.get_directions
      params = {:key => Secrets.API_KEY}
      return YandexDictionaryRequest.make_request("getLangs", params);
    end

    def self.translate(text, from, to)
      lang = "#{from}-#{to}"

      params = {:key => Secrets.API_KEY,
      :text => text,
      :lang => lang
      }

      return YandexDictionaryRequest.make_request("lookup", params)
    end
  end
end
