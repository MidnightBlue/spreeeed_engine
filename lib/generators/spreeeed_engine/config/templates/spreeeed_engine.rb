SpreeeedEngine.setup do |config|
  config.devise_auth_resource = 'user'
  config.namespace            = '<%= @spreeeed_engine_namespace %>'
  config.default_locale       = :en
  config.available_locales    = [:en, :'zh-TW']
  config.default_time_zone    = 'Taipei'
end
