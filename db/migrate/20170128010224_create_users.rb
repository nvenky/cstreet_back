class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :auth_id
      t.string :auth_name
      t.string :email
      t.boolean :email_verified
      t.string :care_for
      t.string :first_name
      t.string :last_name
      t.string :elder_first_name
      t.string :elder_last_name
      t.string :mobile
      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :auth0_id_string, unique: true
  end
end
