class CreatePolySettings < ActiveRecord::Migration[7.1]
  def change
    create_table :poly_settings do |t|
      t.text :content
      t.references :settingable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
