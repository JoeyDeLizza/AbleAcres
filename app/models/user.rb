class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :FirstName, :LastName, :email, :password, presence: true
  def welcome
    "Hello"
  end
end
