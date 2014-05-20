class User < ActiveRecord::Base

	before_save { self.email = email.downcase }

	validates(:name, {presence: true, length: {maximum: 50}})
	#validates :name, presence: true

	validates :email, presence: true

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

	validates :password, length: { minimum: 6 }
	#(Presence validations for the password and its confirmation are automatically added by has_secure_password.)
	has_secure_password

end
