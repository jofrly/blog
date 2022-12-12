class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true
  validates :username, uniqueness: true

  def self.with_username(username)
    find_by("lower(username) = ?", username.downcase)
  end
end
