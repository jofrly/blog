class User < ApplicationRecord
  has_secure_password

  def self.with_username(username)
    find_by("lower(username) = ?", username.downcase)
  end
end
