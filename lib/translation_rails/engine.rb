require "active_record/railtie"
require 'translation_rails/translation_center'
require 'translation_rails/dependencies'
require 'translation_rails/controller_extend'

module TranslationRails
  class Engine < ::Rails::Engine
    isolate_namespace TranslationRails
  end
end