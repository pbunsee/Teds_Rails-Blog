class AddFirstnameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string, :limit => 50

  end
end
