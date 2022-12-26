class Post < ApplicationRecord
  has_rich_text :content

  belongs_to :user

  validates :title, :content, :slug, presence: true

  before_validation :set_slug, if: Proc.new { slug.blank? }
  before_validation :parameterize_slug, if: Proc.new { slug.present? }
  before_validation :ensure_slug_uniqueness, if: Proc.new { slug.present? }

  def content_preview
    content.to_plain_text.truncate(350)
  end

  def to_param
    slug
  end

  private

  def set_slug
    self.slug = title
  end

  def parameterize_slug
    self.slug = self.slug.parameterize
  end

  def ensure_slug_uniqueness
    return if self.class.where.not(id: self.id).where(slug: self.slug).none?

    self.slug = "#{self.slug}-#{SecureRandom.hex}"
  end
end
