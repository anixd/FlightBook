class CreateMotoBrands < ActiveRecord::Migration[7.1]
  def change
    create_table :moto_brands do |t|
      t.string :name, null: false
      t.string :country

      t.timestamps
    end
  end
end
