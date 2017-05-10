class Affiliate < ApplicationRecord

	has_many :meetings
	belongs_to :user

	scope :sorted, lambda { order("title ASC") }
	scope :newest_first, lambda { order("created_at DESC") }
	scope :search, lambda {|query| where(["title LIKE ?", "%#{query}%"]) }

	EMAIL_REGEX = /\A[a-z0-9.%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
	FORBIDDEN_TITLES = ['fuck', 'cunt']

	validates :title, :presence => true,
									:length => {:maximum => 50},
									:uniqueness => true
	validate :title_is_allowed
	validates :phone_number, :presence => true,
													:length => {:within => 8..20}
	validates :email, :presence => true,
										:length => {:maximum => 100},
										:format => EMAIL_REGEX,
										:confirmation => true
	validates :suburb, :length => {:maximum => 20}
	validates :annual_fee, :presence => true
	validates_presence_of :category

	private

	def title_is_allowed
		if FORBIDDEN_TITLES.include?(title)
			errors.add(:title, "has been restricted from use.")
		end
	end

end
