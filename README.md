translation-rails
=================

include translation_center use it

Setup:

  gem 'translation_center', :git => "https://github.com/jypandjio/translation_center"

  gem 'translation_rails'

  rails g translation_rails:install

  rake db:migrate

  rake translation_rails:add_lang[en]

  To migrate translations from TranslationCenter database to yaml files

  rake translation_center:db2yaml

  To migrate translations from yaml files to TranslationCenter database

  rake translation_center:yaml2db



  
