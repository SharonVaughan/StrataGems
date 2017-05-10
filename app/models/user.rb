class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :affiliates
	has_many :attendances
	has_many :meetings, through: :attendances

	scope :visible, lambda { where(:visible => true) }
	scope :invisible, lambda { where(:visible => false) }
	scope :sorted, lambda { order("username ASC") }
	scope :newest_first, lambda { order("created_at DESC") }
	scope :search, lambda {|query| where(["username LIKE ?", "%#{query}%"]) }

	EMAIL_REGEX = /\A[a-z0-9.%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	validates :first_name, :presence => true,
													:length => {:maximum => 25}
	validates :last_name, :presence => true,
												:length => {:maximum => 50}
	validates :phone_number, :presence => true,
													:length => {:within => 8..20}
	validates :email, :presence => true,
										:length => {:maximum => 100},
										:format => EMAIL_REGEX,
										:confirmation => true
	validates :username, :length => {:within => 6..25},
											:uniqueness => true
    
end
