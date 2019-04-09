SpreeeedEngine.setup do |config|
  config.devise_auth_resource = 'user'
  config.namespace            = '<%= @spreeeed_engine_namespace %>'
  config.default_locale       = :en
  config.available_locales    = [:en, :'zh-TW']
  config.default_time_zone    = 'Taipei'
end

I18n.default_locale    = SpreeeedEngine.default_locale
I18n.available_locales = SpreeeedEngine.available_locales
