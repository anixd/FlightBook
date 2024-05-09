class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username, null: false, index: { unique: true }
      t.string :email, null: false
      t.string :firstname
      t.string :lastname
      t.string :displayname
      t.string :password_digest
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
