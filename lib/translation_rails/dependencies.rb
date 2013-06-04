require 'active_support/dependencies'
module ActiveSupport
  module Dependencies
    module Extend

      def self.included(base)
        base.class_eval do
          alias_method_chain :require_or_load, :translation_rails
        end
      end

      def require_or_load_with_translation_rails(file_name, const_path = nil)
        require_or_load_without_translation_rails(file_name, const_path)
        if file_name.starts_with?(Rails.root.to_s + '/app')
          relative_name = file_name.gsub(Rails.root.to_s, '')
          engine_file = File.join(TranslationRails::Engine.root, relative_name)
          require_or_load_without_translation_rails(engine_file, const_path) if File.file?(engine_file)
        end
      end
    end
    include Extend
  end
end

