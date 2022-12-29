class PostSlug
  def initialize(post)
    @post = post
  end

  def ensure_presence
    set_slug if slug.blank?
    parameterize_slug if slug.present?
    ensure_slug_uniqueness if slug.present?
  end

  private

  def slug
    @post.slug
  end

  def set_slug
    @post.slug = @post.title
  end

  def parameterize_slug
    @post.slug = slug.parameterize
  end

  def ensure_slug_uniqueness
    return if Post.where.not(id: @post.id).where(slug: slug).none?

    @post.slug = "#{slug}-#{SecureRandom.hex}"
  end
end
