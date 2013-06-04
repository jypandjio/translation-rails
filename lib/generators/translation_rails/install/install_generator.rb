module TranslationRails
  class InstallGenerator < Rails::Generators::Base
    source_root TranslationRails::Engine.root

    def install_config
      copy_file 'config/translation_center.yml', 'config/translation_center.yml'
      ignore_file("config/translation_center.yml")
    end

    def create_locales
      FileUtils.mkdir_p("config/locales")
      ignore_file("config/locales")
    end

    private

    def ignore_file(file_name)
      append_file ".gitignore", "\n#{file_name}", force: true
    end
  end
end