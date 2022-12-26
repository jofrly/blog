class Post < ApplicationRecord
  has_rich_text :content

  belongs_to :user

  validates :title, :content, presence: true

  def content_preview
    content.to_plain_text.truncate(350)
  end
end
