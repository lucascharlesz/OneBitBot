require 'httparty'
require 'i18n'

class TranslateService
  def initialize(params, action)
    @url = 'https://translate.yandex.net/api/v1.5/tr.json/translate'
    @key = 'trnsl.1.1.20190703T142045Z.7903233305877a41.a2ecb704b8f4bab76ca2272245df0b4c90c32694'
    @action = action
    @text = I18n.transliterate(params[:text])
  end

  def call
    if @action == 'translate_to_english'
      translate_request('pt-en')
    elsif @action == 'translate_from_english'
      translate_request('en-pt')
    end

    if @response.parsed_response['code'] == 200
      @response.parsed_response['text'].first
    else
      'Desculpe, nao consegui traduzir'
    end
  end

  def translate_request(lang)
    @response = HTTParty.get("#{@url}?key=#{@key}&text=#{ERB::Util.url_encode(@text)}&lang=#{lang}")
  end
end
