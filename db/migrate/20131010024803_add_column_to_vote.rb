class AddColumnToVote < ActiveRecord::Migration
  def change
  	add_column :votes, :old, :boolean
  end
end
