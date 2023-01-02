module PostInteractor
  class Create
    include Interactor

    delegate :user, :post_params, to: :context

    def call
      build_post
      ensure_slug
      save_post
    end

    private

    def build_post
      context.post = user.posts.new(post_params)
    end

    def ensure_slug
      return if context.post.slug.present?
      return if context.post.title.blank?

      context.post.slug = context.post.title.parameterize
    end

    def save_post
      return if context.post.save

      context.fail!
    end
  end
end
