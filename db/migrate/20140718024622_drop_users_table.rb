class DropUsersTable < ActiveRecord::Migration
  def change
  	drop_table :users

  	create_table :users do |t|
  	  t.string :username
      t.text :biography
      t.text :phone
      t.string :password_digest
      t.string :email
      t.timestamps
    end
  end
end
