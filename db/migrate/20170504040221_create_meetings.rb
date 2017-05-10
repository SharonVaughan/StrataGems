class CreateMeetings < ActiveRecord::Migration[5.0]

  def change
    create_table :meetings do |t|
    	t.integer "affiliate_id"
    	t.string "title", :limit => 50
    	t.text "blurb"
    	t.string "address"
    	t.string "suburb", :limit => 20
    	t.integer "postcode"
      t.timestamps
    end
    add_index("meetings", "affiliate_id")
  end

end
