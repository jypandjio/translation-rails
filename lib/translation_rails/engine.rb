require "active_record/railtie"
require "translation_rails/sprockets"
require 'translation_rails/translation_center'

module TranslationRails
  class Engine < ::Rails::Engine
    isolate_namespace TranslationRails
  end
end