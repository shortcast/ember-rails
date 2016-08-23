require 'ember/handlebars/template'
require 'active_model_serializers'
require 'sprockets/railtie'

module Ember
  module Rails
    class Engine < ::Rails::Engine
      config.handlebars = ActiveSupport::OrderedOptions.new

      config.handlebars.precompile = true
      config.handlebars.templates_root = "templates"
      config.handlebars.templates_path_separator = '/'
      config.handlebars.output_type = :global

      config.before_initialize do |app|
        Sprockets::Engines #force autoloading
        Sprockets.register_mime_type '"text/x-handlebars-template', extensions: ['.handlebars', '.hbs', '.hjs'], charset: :unicode
        Sprockets.register_preprocessor 'text/x-handlebars-template', Ember::Handlebars::Template
      end
    end
  end
end
