class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string :email
      t.string :password

      t.timestamps
    end
    Manager.create(email: TranslationCenter::CONFIG["yaml_translator_identifier"])
  end
end

# 20130523095615
