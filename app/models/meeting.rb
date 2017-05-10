class Meeting < ApplicationRecord

	acts_as_votable

	belongs_to :affiliate
	has_many :attendances
	has_many :students, through: :attendances

	scope :visible, lambda { where(:visible => true) }
	scope :invisible, lambda { where(:visible => false) }
	scope :sorted, lambda { order("title ASC") }
	scope :newest_first, lambda { order("created_at DESC") }

	FORBIDDEN_TITLES = ['fuck', 'cunt']

  validates :title, :presence => true,
									:length => {:maximum => 50},
									:uniqueness => true
	validate :title_is_allowed
  validates_presence_of :blurb

	private

	def title_is_allowed
		if FORBIDDEN_TITLES.include?(title)
			errors.add(:title, "has been restricted from use.")
		end
	end

end
