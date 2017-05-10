class Attendance < ApplicationRecord

	belongs_to :meeting
	belongs_to :student

	scope :visible, lambda { where(:visible => true) }
	scope :invisible, lambda { where(:visible => false) }
	scope :newest_first, lambda { order("created_at DESC") }

end
