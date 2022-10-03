class User < ApplicationRecord
  has_secure_password

  def welcome
    "Hello"
  end
end
