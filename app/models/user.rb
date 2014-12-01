class User < ActiveRecord::Base
	has_secure_password

	has_one :profile
	has_many :jokes
	has_many :user_comments
	has_many :votes
  validates_uniqueness_of :email

    # transaltes any uppercase email characters to lower case
	before_save { |user| user.email = user.email.downcase }
    # verifies if email has been take
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
	
	validates :email, presence: true, format: {with: VALID_EMAIL_REGEX},
            uniqueness: { case_sensitive: false }
    
    validates :password, presence: true, length: { minimum: 5 }
    
    validates :password_confirmation, presence: true
   		 
end

  


