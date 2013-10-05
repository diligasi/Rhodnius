module SetLanguageHelper
  def language_links
    links = []
    I18n.available_locales.each do |locale|
      locale_key = "translation.#{locale}"
      if locale == I18n.locale
        links << link_to(I18n.t(locale_key), '#', class: 'btn disabled')
      else
        links << link_to(I18n.t(locale_key), choose_method(locale), class: 'btn')
      end
    end
    links.sort.join('|').html_safe
  end

  def choose_method(language)
    case language
      when :'pt-BR' then
        return 'pt-BR'
      when :es then
        return 'es'
      else
        return 'en'
    end
  end
end
