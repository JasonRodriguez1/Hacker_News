class DeletePasswordColumns < ActiveRecord::Migration
  def change
    remove_column :users, :password
    remove_column :users, :confirm_password
  end
end
