class RemoveFirstnameFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :firstname, :string
  end
end
