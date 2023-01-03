class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true
  validates :username, uniqueness: true

  has_many :posts, dependent: :destroy

  def self.with_username(username)
    find_by('lower(username) = ?', username.downcase)
  end

  def authenticated?
    true
  end
end
