class CreateLink < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end
