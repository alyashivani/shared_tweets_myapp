class User < ApplicationRecord
	has_secure_password

	# validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

	VALID_EMAIL_REGEX = /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/

	validates :email, uniqueness: true, presence: true, format: { with: VALID_EMAIL_REGEX }
end
