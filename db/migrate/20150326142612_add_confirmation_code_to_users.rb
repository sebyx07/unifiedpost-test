class AddConfirmationCodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :confirmation_code, :string
    add_index :users, :confirmation_code
  end
end
