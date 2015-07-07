class AddLastnameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lastname, :string, :limit => 50
  end
end
