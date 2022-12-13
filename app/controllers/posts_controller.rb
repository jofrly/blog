class PostsController < ApplicationController
  before_action :require_login, except: [:index, :show]

  def index
    @posts = Post.all.with_rich_text_content
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Current.user.posts.new(post_params)

    if @post.save
      redirect_to blog_post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to blog_post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
