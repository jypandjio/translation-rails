$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "translation_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "translation_rails"
  s.version     = TranslationRails::VERSION
  s.authors     = ["Jio"]
  s.email       = ["jypandjio@163.com"]
  s.homepage    = ""
  s.summary     = "Translation Rails"
  s.description = "Translation Rails"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["README.md"]

  s.add_dependency "rails", "~> 3.2"
  s.add_dependency 'translation_center'
end
