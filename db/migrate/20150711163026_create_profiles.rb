class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :firstname, :limit => 80
      t.string :lastname, :limit => 80
      t.string :email, :limit => 100
      t.boolean :activated
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
