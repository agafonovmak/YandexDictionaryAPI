module YandexDictionary
  class YandexDictionary::YandexDictionaryRequest
    HOST_URL = "https://dictionary.yandex.net/api/v1/dicservice.json/"

    def self.make_request(path, options)
      uri = URI("https://dictionary.yandex.net/api/v1/dicservice.json/" + path)
      uri.query = URI.encode_www_form(options)
      return Net::HTTP.get(uri)
    end
  end
end
