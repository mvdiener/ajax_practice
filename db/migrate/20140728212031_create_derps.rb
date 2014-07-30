class CreateDerps < ActiveRecord::Migration
  def change
  	create_table :derps do |t|
  		t.integer :user_id
  		t.text :text
  		t.timestamps
  	end
  end
end
