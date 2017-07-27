module YandexDictionary
  class YandexDictionary::ResponceParseService
    def self.parse_translation(response)
      json_data = JSON.parse(response)
      result = Array.new
      json_data['def'][0]['tr'].each do |translation|
        result.push(translation['text'])
      end
      return result
    end

    def self.parse_languages(response)
      response.gsub!(/[\[\]]/, '')
      response.split(',')
    end
  end
end
