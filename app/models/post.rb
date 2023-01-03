class Post < ApplicationRecord
  has_rich_text :content

  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
  validates :slug,
            presence: true,
            uniqueness: true,
            slug: true,
            if: proc { title.present? }

  def content_preview
    content.to_plain_text.truncate(350).delete("\n")
  end

  def to_param
    slug
  end
end
