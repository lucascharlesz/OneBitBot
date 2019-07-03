require_relative './../spec_helper.rb'
require 'i18n'

describe TranslateService do
  describe '#call' do
    it 'translate to english' do
      text = 'Ola meu amigo, tudo bem?'

      @translateService = TranslateService.new({ 'text': text }, 'translate_to_english')

      response = @translateService.call()
      expect(response).to match('Hello my dear friend, how are you?')
    end

    it 'translate from english' do
      text = 'long time no see'

      @translateService = TranslateService.new({ 'text': text }, 'translate_from_english')

      response = @translateService.call()
      expect(I18n.transliterate(response)).to match('faz tempo que nao vejo')
    end
  end
end
