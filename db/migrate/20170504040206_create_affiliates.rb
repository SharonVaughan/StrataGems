class CreateAffiliates < ActiveRecord::Migration[5.0]

  def change
    create_table :affiliates do |t|
    	t.string "title", :limit => 50
    	t.text "about"
    	t.integer "phone_number", :default => '', :null => false
    	t.string "email", :default => '', :null => false
    	t.string "address"
    	t.string "suburb", :limit => 20
    	t.integer "postcode"
    	t.integer "annual_fee"
      t.string "category", :limit => 15
      t.integer "user_id"
      t.timestamps
    end
    add_index("affiliates", "user_id")
  end

end
