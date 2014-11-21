class User < ActiveRecord::Base
	has_secure_password

	has_many :jokes
	has_many :user_comments

    validates_uniqueness_of :email

end
