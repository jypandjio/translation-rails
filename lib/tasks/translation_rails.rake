
namespace :translation_rails do

  def migrate(lang, direction)
    eval "Add#{lang.camelize}Status = Class.new(ActiveRecord::Migration)"
    "Add#{lang.to_s.camelize}Status".constantize.class_eval do
      define_method :change do
        add_column :translation_center_translation_keys, "#{lang}_status", :string, default: 'untranslated'
      end
    end
    "Add#{lang.camelize}Status".constantize.migrate(direction)
  end

  task :add_lang, [:lang] => :environment do |t, args|
    lang = args[:lang].to_s
    migrate(lang, :up)
  end

  task :delete_lang, [:lang] => :environment do |t, args|
    lang = args[:lang].to_s
    migrate(lang, :down)
  end
end