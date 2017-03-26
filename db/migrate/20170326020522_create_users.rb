class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :encrypted_password
      t.string :remember_token
      t.string :confirmation_token

      t.timestamps
    end
  end
end
