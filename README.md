## Translation Rails

## Getting started

```ruby
gem 'translation_center', :git => 'https://github.com/jypandjio/translation_center'
gem 'translation_rails'
```

Run bundle install command

Install translation_rails in your application

```ruby
rails generate translation_rails:install
```

Run the migrations

```ruby
rake db:migrate
```

Run this rake to add some languages to the translation center

```ruby
rake translation_rails:add_lang[en]
rake translation_rails:add_lang[nl]
```

This will add three languages to the translation_center,you need to add them in the config/translation_center.yml

```ruby
development:
  lang:
    en: 
      name: 'English'
      direction: 'ltr'
    ar:
      name: 'Arabic'
      direction: 'rtl'
    de:
      name: 'German'
      direction: 'ltr'
```

To migrate translations from yaml files to TranslationCenter database

```ruby
rake translation_center:yaml2db
```

To migrate translations from TranslationCenter database to yaml files

```ruby
rake translation_center:db2yaml
```

Visit translation_center: http://localhost:port/translation_center
