require "translation_center"

if FileTest.exists?(file_path=File.expand_path("../../../config/translation_center.yml", __FILE__))
  TranslationCenter::CONFIG.deep_merge!(YAML.load_file(file_path)[Rails.env])
end


