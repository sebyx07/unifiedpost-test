class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :country_id
      t.string :city
    end
    add_index :users, :email
  end
end
