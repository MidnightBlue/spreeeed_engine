SpreeeedEngine.setup do |config|
  config.devise_auth_resource = 'user'
  config.namespace            = '<%= @spreeeed_engine_namespace %>'
  config.default_locale       = :en
  config.available_locales    = [:en, :'zh-TW']
  config.default_time_zone    = 'Taipei'

  I18n.available_locales      = config.available_locales
  I18n.default_locale         = config.default_locale
end
