class User < ActiveRecord::Base
	has_secure_password

	has_one :profile
	has_many :jokes
	has_many :user_comments
	has_many :votes
  validates_uniqueness_of :email

end
