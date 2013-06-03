class CreateTranslationCenterTranslationKeys < ActiveRecord::Migration
  def change
    create_table :translation_center_translation_keys do |t|
      t.string :name
      t.integer :category_id
      t.datetime :last_accessed
      
      t.string :en_status, default: 'untranslated'
      
      t.string :nl_status, default: 'untranslated'
      

      t.timestamps
    end
  end
end

# 20130522073522682472

class AddEnStatusToTranslationKeys < ActiveRecord::Migration
  def change
    add_column :translation_center_translation_keys, :en_status, :string, default: 'untranslated'
  end
end

if TranslationCenter::CONFIG[:lang].each do |k, v|
  eval "Add#{k.to_s.camelize}StatusToTranslationCenterTranslationKeys = Class.new(ActiveRecord::Migration)"
  "Add#{k.to_s.camelize}StatusToTranslationCenterTranslationKeys".constantize.class_eval do
    def change
      add_column :translation_center_translation_keys, "#{k}_status", :string, default: 'untranslated'
    end
  end
end



