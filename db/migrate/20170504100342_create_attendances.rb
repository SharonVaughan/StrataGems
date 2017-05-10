class CreateAttendances < ActiveRecord::Migration[5.0]

  def change
    create_table :attendances do |t|
    	t.integer "meeting_id"
    	t.integer "user_id"
    	t.boolean "attended_meeting"
    	t.boolean "rating_provided"
      t.timestamps
    end
    add_index("attendances", ["meeting_id", "user_id"])
  end

end
