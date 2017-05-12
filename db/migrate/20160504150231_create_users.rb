class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :name, :string, null: false, limit: 60
	    t.column :contactno, :string, null: false, limit: 10
	    t.column :address, :string, null: false, limit: 60
	    t.column :email, :string, null: false, limit: 30
	    t.column :password, :string, null: false, limit: 30
      t.timestamps null: false
    end
  end
end
