class CreateMotoModels < ActiveRecord::Migration[7.1]
  def change
    create_table :moto_models do |t|
      t.string :name, null: false
      t.string :nickname
      t.string :wiki_url_ru
      t.string :wiki_url_en
      t.integer :production_start
      t.integer :production_end
      t.string :market
      t.references :moto_brand, null: false, foreign_key: { to_table: :moto_brands }

      t.timestamps
    end
  end
end
