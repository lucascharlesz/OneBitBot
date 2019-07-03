class InterpretService
  def self.call action, params
    case action
    when "list", "search", "search_by_hashtag"
      FaqModule::ListService.new(params, action).call()
    when "create"
      FaqModule::CreateService.new(params).call()
    when "remove"
      FaqModule::RemoveService.new(params).call()
    when "help"
      HelpService.call()
    when "translate_to_english", "translate_from_english"
      TranslateService.new(params, action).call()
    else
      "Não compreendi o seu desejo"
    end
  end
end
