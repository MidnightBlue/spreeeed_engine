module SpreeeedEngine
  require 'spreeeed_engine/active_record_extension'
  require 'spreeeed_engine/datatable_cell'
  require 'spreeeed_engine/datatable_extension'
  require 'spreeeed_engine/regexp_to_js'
  require 'spreeeed_engine/aasm_run_time'
  require 'spreeeed_engine/acts_as_option_tree'

  require 'devise'
  require 'simple_form'
  require 'cocoon'
  require 'aasm'
  require 'carrierwave'
  require 'spreeeed_engine/patch/carrierwave/uploader/serialization'
  require 'mini_magick'
  require 'will_paginate-bootstrap'
  require 'wysiwyg-rails'
  require 'rails_autolink'



  require 'bootstrap-sass'
  require 'rails-assets-font-awesome'
  require 'rails-assets-jquery.gritter'
  require 'rails-assets-jasny-bootstrap'
  require 'rails-assets-parsleyjs'
  require 'rails-assets-jquery-ui'
  require 'rails-assets-datatables'
  require 'rails-assets-icheck'
  require 'rails-assets-bootstrap3-datetimepicker'
  require 'rails-assets-moment'
  require 'rails-assets-bootstrap-switch'
  require 'rails-assets-fuelux'
  require 'rails-assets-jquery.cookie'
  require 'rails-assets-jPushMenu'
  require 'rails-assets-nanoscroller'
  require 'rails-assets-select2'
  require 'rails-assets-select2-bootstrap3-css'
  require 'rails-assets-jquery-option-tree'
  require 'rails-assets-bootstrap3-typeahead'
  require 'rails-assets-input-autogrow'
  require 'rails-assets-dirrty'
  require 'rails-assets-typeahead.js'
  require 'rails-assets-bootstrap-tagsinput'
  require 'rails-assets-bootstrap-daterangepicker'


  class << self
    mattr_accessor :devise_auth_resource, :namespace, :locale, :path
    self.devise_auth_resource = 'user'
    self.namespace            = 'admin'
    self.default_locale       = :en
    self.available_locales    = [:en, :'zh-TW']
    self.default_time_zone    = 'Taipei'
  end

  def self.setup(&block)
    yield self
  end


  class Engine < ::Rails::Engine
    engine_name 'spreeeed_engine'

    config.time_zone = SpreeeedEngine.default_time_zone

    config.i18n.load_path += Dir["#{config.root}/config/locales/**/*.yml"]
    SpreeeedEngine.path = config.i18n.load_path
    config.i18n.available_locales SpreeeedEngine.available_locales
    config.i18n.default_locale = SpreeeedEngine.default_locale

    # config.action_controller.include_all_helpers = false


    initializer 'SpreeeedEngine.assets.precompile' do |app|
      app.config.assets.precompile += %w(spreeeed_engine/ajax-loader.gif)
    end

    Devise.parent_controller = 'SpreeeedEngine::Devise::ParentController'

    CarrierWave::Uploader::Base.prepend SpreeeedEngine::Patch::CarrierWave::Uploader::Serialization

    isolate_namespace SpreeeedEngine
  end
end
