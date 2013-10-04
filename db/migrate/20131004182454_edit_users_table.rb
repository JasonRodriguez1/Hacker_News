class EditUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :password, :integer
    add_column :users, :confirm_password, :integer
  end
end
