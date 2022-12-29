class Post < ApplicationRecord
  has_rich_text :content

  belongs_to :user

  validates :title, :content, :slug, presence: true

  before_validation { PostSlug.new(self).ensure_presence }

  def content_preview
    content.to_plain_text.truncate(350)
  end

  def to_param
    slug
  end
end
