require 'rails/generators/active_record'

module SpreeeedEngine
  # module ActiveRecord
  #   module Generators
  #
  #     class FakeObjectGenerator < ::ActiveRecord::Generators::Base
  #       source_root File.expand_path('../templates', __FILE__)
  #
  #       def copy_spreeeed_engine_migration
  #         migration_template 'migration.rb', "db/migrate/spreeeed_engine_create_#{@file_name.pluralize}.rb", migration_version: migration_version
  #       end
  #
  #       def migration_version
  #         if rails5?
  #           "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]"
  #         end
  #       end
  #
  #       def rails5?
  #         Rails.version.start_with? '5'
  #       end
  #     end
  #
  #   end
  # end
end

