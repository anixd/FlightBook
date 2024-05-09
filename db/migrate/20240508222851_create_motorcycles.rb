class CreateMotorcycles < ActiveRecord::Migration[7.1]
  def change
    create_table :motorcycles do |t|
      t.references :moto_model, null: false, foreign_key: { to_table: :moto_models }
      t.references :moto_brand, null: false, foreign_key: { to_table: :moto_brands }
      t.integer :year, null: false
      t.string :color, null: false
      t.string :vin
      t.string :plate_number
      t.string :name
      t.boolean :visible, default: false, null: false
      t.bigint :visible_to_users, array: true, default: []
      t.references :current_owner, null: false, foreign_key: { to_table: :users }


      t.timestamps
    end
  end
end
